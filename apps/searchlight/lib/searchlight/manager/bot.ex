defmodule Searchlight.Manager.Bot do
  use Ecto.Schema
  import Ecto.Changeset
  alias Searchlight.Manager.Bot
  alias Searchlight.Manager.BotType

  schema "bots" do

    field :name, :string
    field :host, :string
    field :active, :boolean, default: false
    field :claim_code, :string
    field :is_deleted, :boolean, default: false
    belongs_to :bot_type, BotType
    timestamps()
  end

  @doc false
  def changeset(%Bot{} = bot, attrs) do
    bot
    |> cast(attrs, [:name, :host, :bot_type_id, :active, :claim_code, :is_deleted])
    |> validate_required([:name, :host])
  end
end
