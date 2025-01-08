defmodule PhoenixInertia.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixInertiaWeb.Telemetry,
      PhoenixInertia.Repo,
      {DNSCluster, query: Application.get_env(:phoenix_inertia, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixInertia.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixInertia.Finch},
      # Start a worker by calling: PhoenixInertia.Worker.start_link(arg)
      # {PhoenixInertia.Worker, arg},

      # Start the SSR process pool
      # You must specify a `path` option to locate the directory where the `ssr.js` file lives.
      {Inertia.SSR, path: Path.join([Application.app_dir(:phoenix_inertia), "priv"])},


      # Start to serve requests, typically the last entry
      PhoenixInertiaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixInertia.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixInertiaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
