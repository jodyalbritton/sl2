defmodule SearchlightWeb.BotController do
  use SearchlightWeb, :controller

  alias Searchlight.Manager
  alias Searchlight.Manager.Bot


  def index(conn, _params) do
    bots = Manager.list_bots()
    render(conn, "index.html", bots: bots)
  end

  def new(conn, _params) do
    bot_types = Manager.list_bot_types_for_select
    changeset = Manager.change_bot(%Bot{})
    render(conn, "new.html", changeset: changeset, bot_types: bot_types)
  end

  def create(conn, %{"bot" => bot_params}) do
    case Manager.create_bot(bot_params) do
      {:ok, bot} ->
        conn
        |> put_flash(:info, "Bot created successfully.")
        |> redirect(to: bot_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bot = Manager.get_bot!(id)  
    render(conn, "show.html", bot: bot)
  end

  def edit(conn, %{"id" => id}) do
    bot_types = Manager.list_bot_types_for_select
    bot = Manager.get_bot!(id)
    changeset = Manager.change_bot(bot)
    render(conn, "edit.html", bot: bot, changeset: changeset, bot_types: bot_types)
  end

  def update(conn, %{"id" => id, "bot" => bot_params}) do
    bot = Manager.get_bot!(id)

    case Manager.update_bot(bot, bot_params) do
      {:ok, bot} ->
        conn
        |> put_flash(:info, "Bot updated successfully.")
        |> redirect(to: bot_path(conn, :show, bot))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bot: bot, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bot = Manager.get_bot!(id)
    {:ok, _bot} = Manager.delete_bot(bot)

    conn
    |> put_flash(:info, "Bot deleted successfully.")
    |> redirect(to: bot_path(conn, :index))
  end
end
