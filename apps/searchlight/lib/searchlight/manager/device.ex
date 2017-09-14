defmodule Searchlight.Manager.Device do
  use Ecto.Schema
  import Ecto.Changeset
  alias Searchlight.Manager.Device


  schema "devices" do
    field :capabilities, {:array, :string}
    field :device_type, :string
    field :device_uuid, :string
    field :display_name, :string
    field :label, :string
    field :account_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Device{} = device, attrs) do
    device
    |> cast(attrs, [:device_uuid, :display_name, :label, :capabilities, :device_type])
    |> validate_required([:device_uuid, :display_name])
  end
end
