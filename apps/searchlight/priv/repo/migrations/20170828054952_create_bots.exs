defmodule Searchlight.Repo.Migrations.CreateBots do
  use Ecto.Migration

  def change do
    create table(:bots) do
      add :name, :string
      add :host, :string
      
      timestamps()
    end

  end
end
