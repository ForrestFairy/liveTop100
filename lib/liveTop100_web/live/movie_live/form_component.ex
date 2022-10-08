defmodule LiveTop100Web.MovieLive.FormComponent do
  use LiveTop100Web, :live_component

  alias LiveTop100.Movies
  alias LiveTop100.Movies.Movie

  @impl true
  def update(%{movie: movie} = assigns, socket) do

    {:ok,
      socket
      |> assign(assigns: assigns)
      |> assign(changeset: Movies.change_movie(movie))
    }
  end

  @impl true
  def handle_event("validate", %{"movie" => params}, socket) do
    # IO.inspect params
    changeset =
      %Movie{}
      |> Movies.change_movie(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end


end
