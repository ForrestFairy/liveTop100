defmodule LiveTop100Web.MovieLiveTest do
  use LiveTop100Web.ConnCase
  import Phoenix.LiveViewTest

  @valid_params %{name: "Lotr", priority: 1}
  @invalid_params %{name: "sth", priority: 0}

  test "load index page with title and list of movies", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.movie_index_path(conn, :index))

    assert has_element?(view, "#hi", "Your top 100 movies")
    assert has_element?(view, "#movies", "")
    # open_browser(view)
  end

  test "load new page with a form to add new movie", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.movie_new_path(conn, :new))

    assert has_element?(view, "#new-movie")
  end

  test "click 'new' button to see modal for adding new movie", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.movie_index_path(conn, :index))

    assert has_element?(view, "#add", "Add")

    assert view
           |> element("button#add")
           |> render_click()

    assert_redirected view, Routes.movie_new_path(conn, :new)
  end

  describe "adding new movies to database" do
    test "create new movie with valid params", %{conn: conn} do
      {:ok, view, _html} = live(conn, Routes.movie_new_path(conn, :new))

      assert view
            |> element("form")
            |> render_submit(@valid_params)

      # assert_redirected view, Routes.movie_index_path(conn, :index)
    end

    # test "create new movie with invalid params", %{conn: conn} do
    #   {:ok, view, _html} = live(conn, Routes.movie_new_path(conn, :new))

    #   assert view
    #         |> element("form")
    #         |> render_submit(@invalid_params)
    # end
  end

end
