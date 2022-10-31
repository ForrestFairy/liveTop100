defmodule LiveTop100Web.MovieLive.New do
  use LiveTop100Web, :live_view

  alias LiveTop100.Movies
  alias LiveTop100.Movies.Movie

  @impl true
  def mount(_params, _session, socket) do
    socket = assign(socket, movie: %Movie{})
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    case socket.assigns.live_action do
      :edit ->
        socket = assign(socket, movie: Movies.get_movie!(params["id"]))
        {:noreply, socket}
      :new ->
        {:noreply, socket}
    end
  end
end
