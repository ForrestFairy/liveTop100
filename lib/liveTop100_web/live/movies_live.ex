defmodule LiveTop100Web.MoviesLive do
  use LiveTop100Web, :live_view
  alias LiveTop100.Repo

  def mount(_params, _session, socket) do
    socket = assign(socket, movies: Repo.all(LiveTop100.Movie))

    {:ok, socket}
  end
end
