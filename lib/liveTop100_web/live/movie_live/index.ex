defmodule LiveTop100Web.MovieLive.Index do
  use LiveTop100Web, :live_view
  alias LiveTop100.Movies
  alias LiveTop100.Movies.Movie

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        movies: Movies.list_movies()
      )

    {:ok, socket}
  end

  def handle_event("add-movie", _params, socket) do
    socket = assign(socket, movie: %Movie{})
    {:noreply, push_redirect(socket, to: Routes.movie_new_path(socket, :new))}
  end
end
