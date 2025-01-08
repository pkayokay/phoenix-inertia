defmodule PhoenixInertia.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_inertia,
    adapter: Ecto.Adapters.Postgres
end
