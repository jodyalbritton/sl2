defmodule Searchlight.Repo.Migrations.CreateDashboards do
  use Ecto.Migration

  def change do
    create table(:dashboards) do
      add :name, :string
      add :shareable, :boolean, default: false, null: false
      add :default, :boolean, default: false, null: false
      add :settings, :map
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:dashboards, [:user_id])
  end
end
