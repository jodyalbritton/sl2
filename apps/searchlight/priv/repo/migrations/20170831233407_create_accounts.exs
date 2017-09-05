defmodule Searchlight.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :access_token, :string
      add :client_id, :string
      add :client_secret, :string
      add :name, :string
      add :description, :string
      add :shard, :string
      add :enabled, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:accounts, [:user_id])
  end
end
