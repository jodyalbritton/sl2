defmodule Searchlight.TestManager.TestType do
  use Ecto.Schema
  import Ecto.Changeset
  alias Searchlight.TestManager.TestType


  schema "test_types" do
    field :description, :string
    field :name, :string

    has_many :tests, Searchlight.TestManager.Test
    timestamps()
  end

  @doc false
  def changeset(%TestType{} = test_type, attrs) do
    test_type
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
