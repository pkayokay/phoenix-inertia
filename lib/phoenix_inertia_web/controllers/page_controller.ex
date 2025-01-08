defmodule PhoenixInertiaWeb.PageController do
  use PhoenixInertiaWeb, :controller

  plug :set_admin_layout

  defp set_admin_layout(conn, _opts) do
    put_root_layout(conn, html: {PhoenixInertiaWeb.Layouts, :dead_root})
  end

  def home(conn, _params) do
    render(conn, :home, page_title: "Dead view")
  end

  def test(conn, _params) do
    render(conn, :test)
  end
end
