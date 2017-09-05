defmodule Searchlight.Manager.Account do
  use Ecto.Schema
  import Ecto.Changeset
  alias Searchlight.Manager.Account


  schema "accounts" do
    field :access_token, :string
    field :client_id, :string
    field :client_secret, :string
    field :description, :string
    field :enabled, :boolean, default: false
    field :name, :string
    field :shard, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Account{} = account, attrs) do
    account
    |> cast(attrs, [:access_token, :client_id, :client_secret, :name, :description, :shard, :enabled])
    |> validate_required([:access_token, :client_id, :client_secret, :name, :description, :shard, :enabled])
  end
end
