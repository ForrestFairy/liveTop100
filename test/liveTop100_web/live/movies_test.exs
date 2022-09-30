defmodule LiveTop100Web.MoviesLiveTest do
  use LiveTop100Web.ConnCase
  import Phoenix.LiveViewTest

  test "load index page with title", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.movies_path(conn, :index))

    assert has_element?(view, "#hi", "Your top 100 movies")
    open_browser(view)
  end
end
