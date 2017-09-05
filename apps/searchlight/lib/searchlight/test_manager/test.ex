defmodule Searchlight.TestManager.Test do
  use Ecto.Schema
  import Ecto.Changeset
  alias Searchlight.TestManager.Test


  schema "tests" do
    field :configuration, :map
    field :current_iteration, :integer
    field :description, :string
    field :device_id_set, {:array, :string}
    field :interation, :integer
    field :is_complete, :string
    field :is_running, :boolean, default: false
    field :last_status_message, :string
    field :name, :string
    field :permissions, :map
    field :shareable, :boolean, default: false
    field :state, :map
    field :status, :string
    belongs_to :user, Searchlight.Coherence.User
    belongs_to :test_type, Searchlight.TestManager.TestType
    timestamps()
  end

  @doc false
  def changeset(%Test{} = test, attrs) do
    test
    |> cast(attrs, [:name, :description, :device_id_set, :interation, :current_iteration, :status, :is_running, :is_complete, :state, :configuration, :shareable, :permissions, :last_status_message])
    |> validate_required([:name, :description, :device_id_set, :interation, :current_iteration, :status, :is_running, :is_complete, :state, :configuration, :shareable, :permissions, :last_status_message])
  end
end
