defmodule LiveTop100Web.MovieLive.New do
  use LiveTop100Web, :live_view

  # alias LiveTop100.Movies
  alias LiveTop100.Movies.Movie

  @impl true
  def mount(_params, _session, socket) do
    socket = assign(socket, movie: %Movie{})
    # IO.inspect socket
    {:ok, socket}
  end

end
