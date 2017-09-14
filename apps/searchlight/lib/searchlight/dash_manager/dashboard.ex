defmodule Searchlight.DashManager.Dashboard do
  use Ecto.Schema
  import Ecto.Changeset
  alias Searchlight.DashManager.Dashboard


  schema "dashboards" do
    field :default, :boolean, default: false
    field :name, :string
    field :settings, :map
    field :shareable, :boolean, default: false
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Dashboard{} = dashboard, attrs) do
    dashboard
    |> cast(attrs, [:name, :shareable, :default, :settings])
    |> validate_required([:name, :shareable, :default, :settings])
  end
end
