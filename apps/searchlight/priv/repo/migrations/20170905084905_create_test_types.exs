defmodule Searchlight.Repo.Migrations.CreateTestTypes do
  use Ecto.Migration

  def change do
    create table(:test_types) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
