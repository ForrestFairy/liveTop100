defmodule LiveTop100.Movies do
  alias LiveTop100.Movies.Movie
  import Ecto.Query, warn: false
  alias LiveTop100.Repo

  def list_movies() do
    Repo.all(Movie)
  end

  def get_movie!(priority), do: Repo.get!(Movie, priority)

  def create_user(attrs \\ %{}) do
    %Movie{}
    |> Movie.changeset(attrs)
    |> Repo.insert()
  end

  def update_movie(%Movie{} = movie, attrs) do
    movie
    |> Movie.changeset(attrs)
    |> Repo.update()
  end

  def delete_movie(%Movie{} = movie) do
    Repo.delete(movie)
  end

  def change_movie(%Movie{} = movie, attrs \\ %{}) do
    Movie.changeset(movie, attrs)
  end
end
