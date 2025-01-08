defmodule PhoenixInertiaWeb.ProfileController do
  use PhoenixInertiaWeb, :controller

  def index(conn, _params) do
    conn
    |> assign_prop(:text, "Hello world")
    |> render_inertia("ProfilePage")
  end
end
