defmodule Searchlight.Manager.BotType.TitleSlug do
  use EctoAutoslugField.Slug, from: :name, to: :slug
end


defmodule Searchlight.Manager.BotType do
  use Ecto.Schema
  import Ecto.Changeset
  alias Searchlight.Manager.BotType
  alias Searchlight.Manager.Bot
  alias Searchlight.Manager.BotType.TitleSlug


  schema "bot_types" do
    field :name, :string
    field :slug, TitleSlug.Type
    field :description, :string
    field :default_port, :integer
    field :logo_url, :string
    field :developer_url, :string
    field :website, :string
    field :controllable, :boolean, default: true

    has_many :bots, Bot
    timestamps()
  end

  @doc false
  def changeset(%BotType{} = bot_type, attrs) do
    bot_type
    |> cast(attrs, [:name, :description, :default_port, :logo_url, :developer_url, :website, :controllable])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
    |> TitleSlug.maybe_generate_slug
    |> TitleSlug.unique_constraint
  end
end
