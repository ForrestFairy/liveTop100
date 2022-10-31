defmodule LiveTop100Web.MovieLive.Show do
  use LiveTop100Web, :live_view

  alias LiveTop100.Movies

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _url, socket) do

    {:noreply, assign(socket, :movie, Movies.get_movie!(id))}
  end
end
