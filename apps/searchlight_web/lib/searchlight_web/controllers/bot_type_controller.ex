defmodule SearchlightWeb.BotTypeController do
  use SearchlightWeb, :controller

  alias Searchlight.Manager
  alias Searchlight.Manager.BotType

  def index(conn, _params) do
    bot_types = Manager.list_bot_types()
    render(conn, "index.html", bot_types: bot_types)
  end

  def new(conn, _params) do
    changeset = Manager.change_bot_type(%BotType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"bot_type" => bot_type_params}) do
    case Manager.create_bot_type(bot_type_params) do
      {:ok, bot_type} ->
        conn
        |> put_flash(:info, "Bot type created successfully.")
        |> redirect(to: bot_type_path(conn, :show, bot_type))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bot_type = Manager.get_bot_type!(id)
    render(conn, "show.html", bot_type: bot_type)
  end

  def edit(conn, %{"id" => id}) do
    bot_type = Manager.get_bot_type!(id)
    changeset = Manager.change_bot_type(bot_type)
    render(conn, "edit.html", bot_type: bot_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bot_type" => bot_type_params}) do
    bot_type = Manager.get_bot_type!(id)

    case Manager.update_bot_type(bot_type, bot_type_params) do
      {:ok, bot_type} ->
        conn
        |> put_flash(:info, "Bot type updated successfully.")
        |> redirect(to: bot_type_path(conn, :show, bot_type))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bot_type: bot_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bot_type = Manager.get_bot_type!(id)
    {:ok, _bot_type} = Manager.delete_bot_type(bot_type)

    conn
    |> put_flash(:info, "Bot type deleted successfully.")
    |> redirect(to: bot_type_path(conn, :index))
  end
end
