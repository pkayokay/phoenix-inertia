defmodule PhoenixInertiaWeb.TestController do
  use PhoenixInertiaWeb, :controller

  def index(conn, _params) do
    conn
    |> assign_prop(:text, "TestPage.jsx")
    |> assign(:page_title, "React page")
    |> render_inertia("TestPage")
  end
end
