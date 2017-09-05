defmodule Searchlight.Repo.Migrations.CreateBotTypes do
  use Ecto.Migration

  def change do
    create table(:bot_types) do
      add :name, :string
      add :slug, :string
      add :description, :string
      add :default_port, :integer
      add :controllable, :boolean, default: true
      timestamps()
    end
    create unique_index(:bot_types, [:slug]) # should be unique
  end
end
