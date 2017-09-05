defmodule Searchlight.Manager do
  @moduledoc """
  The Manager context.
  """

  import Ecto.Query, warn: false
  alias Searchlight.Repo

  alias Searchlight.Manager.Bot
  alias Searchlight.Manager.BotType

  @doc """
  Returns the list of bots.

  ## Examples

      iex> list_bots()
      [%Bot{}, ...]

  """
  def list_bots do
    Repo.all(Bot)
  end

  @doc """
  Returns the list of bot_types.

  ## Examples

      iex> list_bot_types()
      [%BotType{}, ...]

  """
  def list_bot_types do
    Repo.all(BotType)
    |> Repo.preload([:bots])
  end


  @doc """
  Returns a list of bot type name/id pairs for use in select lists
  """

  def list_bot_types_for_select do
    Repo.all from(s in BotType, order_by: s.name, select: {s.name, s.id})
  end

  @doc """
  Gets a single bot.

  Raises `Ecto.NoResultsError` if the Bot does not exist.

  ## Examples

      iex> get_bot!(123)
      %Bot{}

      iex> get_bot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bot!(id) do
    Repo.get!(Bot, id)
    |> Repo.preload([:bot_type])
  end

  @doc """
  Gets a single bot_type.

  Raises `Ecto.NoResultsError` if the Bot type does not exist.

  ## Examples

      iex> get_bot_type!(123)
      %BotType{}

      iex> get_bot_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bot_type!(id) do
    Repo.get!(BotType, id)
    |> Repo.preload([:bots])
  end

  @doc """
  Creates a bot.

  ## Examples

      iex> create_bot(%{field: value})
      {:ok, %Bot{}}

      iex> create_bot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bot(attrs \\ %{}) do
    %Bot{}
    |> Bot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bot.

  ## Examples

      iex> update_bot(bot, %{field: new_value})
      {:ok, %Bot{}}

      iex> update_bot(bot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bot(%Bot{} = bot, attrs) do
    bot
    |> Bot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bot.

  ## Examples

      iex> delete_bot(bot)
      {:ok, %Bot{}}

      iex> delete_bot(bot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bot(%Bot{} = bot) do
    Repo.delete(bot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bot changes.

  ## Examples

      iex> change_bot(bot)
      %Ecto.Changeset{source: %Bot{}}

  """
  def change_bot(%Bot{} = bot) do
    Bot.changeset(bot, %{})
  end







  @doc """
  Creates a bot_type.

  ## Examples

      iex> create_bot_type(%{field: value})
      {:ok, %BotType{}}

      iex> create_bot_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bot_type(attrs \\ %{}) do
    %BotType{}
    |> BotType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bot_type.

  ## Examples

      iex> update_bot_type(bot_type, %{field: new_value})
      {:ok, %BotType{}}

      iex> update_bot_type(bot_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bot_type(%BotType{} = bot_type, attrs) do
    bot_type
    |> BotType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BotType.

  ## Examples

      iex> delete_bot_type(bot_type)
      {:ok, %BotType{}}

      iex> delete_bot_type(bot_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bot_type(%BotType{} = bot_type) do
    Repo.delete(bot_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bot_type changes.

  ## Examples

      iex> change_bot_type(bot_type)
      %Ecto.Changeset{source: %BotType{}}

  """
  def change_bot_type(%BotType{} = bot_type) do
    BotType.changeset(bot_type, %{})
  end

  alias Searchlight.Manager.Account

  @doc """
  Returns the list of accounts.

  ## Examples

      iex> list_accounts()
      [%Account{}, ...]

  """
  def list_accounts do
    Repo.all(Account)
  end

  @doc """
  Gets a single account.

  Raises `Ecto.NoResultsError` if the Account does not exist.

  ## Examples

      iex> get_account!(123)
      %Account{}

      iex> get_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_account!(id), do: Repo.get!(Account, id)

  @doc """
  Creates a account.

  ## Examples

      iex> create_account(%{field: value})
      {:ok, %Account{}}

      iex> create_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a account.

  ## Examples

      iex> update_account(account, %{field: new_value})
      {:ok, %Account{}}

      iex> update_account(account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Account.

  ## Examples

      iex> delete_account(account)
      {:ok, %Account{}}

      iex> delete_account(account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account changes.

  ## Examples

      iex> change_account(account)
      %Ecto.Changeset{source: %Account{}}

  """
  def change_account(%Account{} = account) do
    Account.changeset(account, %{})
  end

  alias Searchlight.Manager.Device

  @doc """
  Returns the list of devices.

  ## Examples

      iex> list_devices()
      [%Device{}, ...]

  """
  def list_devices do
    Repo.all(Device)
  end

  @doc """
  Gets a single device.

  Raises `Ecto.NoResultsError` if the Device does not exist.

  ## Examples

      iex> get_device!(123)
      %Device{}

      iex> get_device!(456)
      ** (Ecto.NoResultsError)

  """
  def get_device!(id), do: Repo.get!(Device, id)

  @doc """
  Creates a device.

  ## Examples

      iex> create_device(%{field: value})
      {:ok, %Device{}}

      iex> create_device(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_device(attrs \\ %{}) do
    %Device{}
    |> Device.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a device.

  ## Examples

      iex> update_device(device, %{field: new_value})
      {:ok, %Device{}}

      iex> update_device(device, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_device(%Device{} = device, attrs) do
    device
    |> Device.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Device.

  ## Examples

      iex> delete_device(device)
      {:ok, %Device{}}

      iex> delete_device(device)
      {:error, %Ecto.Changeset{}}

  """
  def delete_device(%Device{} = device) do
    Repo.delete(device)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking device changes.

  ## Examples

      iex> change_device(device)
      %Ecto.Changeset{source: %Device{}}

  """
  def change_device(%Device{} = device) do
    Device.changeset(device, %{})
  end
end
