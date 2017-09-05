defmodule Searchlight.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :device_uuid, :string
      add :display_name, :string
      add :label, :string
      add :capabilities, {:array, :string}
      add :device_type, :string
      add :account_id, references(:accounts, on_delete: :nothing)

      timestamps()
    end

    create index(:devices, [:account_id])
  end
end
