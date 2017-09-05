defmodule Searchlight.Repo.Migrations.AddTypesToBots do
  use Ecto.Migration

  def change do
    alter table(:bots) do
      add :bot_type_id, references(:bot_types)
    end

    create unique_index(:bots, [:bot_type_id])
  end
end
