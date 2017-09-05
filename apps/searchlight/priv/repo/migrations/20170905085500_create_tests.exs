defmodule Searchlight.Repo.Migrations.CreateTests do
  use Ecto.Migration

  def change do
    create table(:tests) do
      add :name, :string
      add :description, :string
      add :device_id_set, {:array, :string}
      add :interation, :integer
      add :current_iteration, :integer
      add :status, :string
      add :is_running, :boolean, default: false, null: false
      add :is_complete, :string
      add :state, :map
      add :configuration, :map
      add :shareable, :boolean, default: false, null: false
      add :permissions, :map
      add :last_status_message, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :test_type_id, references(:test_types, on_delete: :nothing)

      timestamps()
    end

    create index(:tests, [:user_id])
    create index(:tests, [:test_type_id])
  end
end
