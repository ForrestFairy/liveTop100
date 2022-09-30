defmodule LiveTop100.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :priority, :integer, primary_key: :true
      add :name, :string

      timestamps()
    end
  end

end
