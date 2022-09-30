defmodule LiveTop100.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movies" do
    field :priority, :integer
    field :name
  end

  def changeset(movie, params \\ %{}) do
    movie
    |> cast(params, [:priority, :name])
    |> validate_required([:priority, :name])
    |> validate_inclusion(:priority, 1..100)
    |> unique_constraint(:priority)
    |> unique_constraint(:name)
  end

end
