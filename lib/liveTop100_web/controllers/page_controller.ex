defmodule LiveTop100Web.PageController do
  use LiveTop100Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
