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
  def handle_event("validate", %{"movie" => movie_params}, socket) do
    # IO.inspect params
    changeset =
      %Movie{}
      |> Movies.change_movie(movie_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  @impl true
  def handle_event("save", %{"movie" => movie_params}, socket) do
    case Movies.create_movie(movie_params) do
      {:ok, _movie} ->
        {:noreply,
          socket
          |> put_flash(:info, "Movie created successfully")
          |> push_redirect(to: socket.assigns.assigns.return_to)}
      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end


  end
end
