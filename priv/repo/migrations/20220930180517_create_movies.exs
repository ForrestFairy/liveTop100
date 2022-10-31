defmodule LiveTop100.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :priority, :integer, primary_key: true
      add :name, :string

      timestamps()
    end

    create unique_index(:movies, :priority)
    create unique_index(:movies, :name)
  end
end
