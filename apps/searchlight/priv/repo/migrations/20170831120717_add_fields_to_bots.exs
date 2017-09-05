defmodule Searchlight.Repo.Migrations.AddFieldsToBots do
  use Ecto.Migration

  def change do
    alter table(:bots) do
      add :active, :boolean, default: false
      add :claim_code, :string
      add :is_deleted, :boolean, default: false
    end
    create unique_index(:bots, [:claim_code]) # should be unique
  end
end
