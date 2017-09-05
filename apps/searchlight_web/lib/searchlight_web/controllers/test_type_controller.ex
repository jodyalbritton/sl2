defmodule SearchlightWeb.TestTypeController do
  use SearchlightWeb, :controller

  alias Searchlight.TestManager
  alias Searchlight.TestManager.TestType

  def index(conn, _params) do
    test_types = TestManager.list_test_types()
    render(conn, "index.html", test_types: test_types)
  end

  def new(conn, _params) do
    changeset = TestManager.change_test_type(%TestType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"test_type" => test_type_params}) do
    case TestManager.create_test_type(test_type_params) do
      {:ok, test_type} ->
        conn
        |> put_flash(:info, "Test type created successfully.")
        |> redirect(to: test_type_path(conn, :show, test_type))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    test_type = TestManager.get_test_type!(id)
    render(conn, "show.html", test_type: test_type)
  end

  def edit(conn, %{"id" => id}) do
    test_type = TestManager.get_test_type!(id)
    changeset = TestManager.change_test_type(test_type)
    render(conn, "edit.html", test_type: test_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "test_type" => test_type_params}) do
    test_type = TestManager.get_test_type!(id)

    case TestManager.update_test_type(test_type, test_type_params) do
      {:ok, test_type} ->
        conn
        |> put_flash(:info, "Test type updated successfully.")
        |> redirect(to: test_type_path(conn, :show, test_type))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", test_type: test_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    test_type = TestManager.get_test_type!(id)
    {:ok, _test_type} = TestManager.delete_test_type(test_type)

    conn
    |> put_flash(:info, "Test type deleted successfully.")
    |> redirect(to: test_type_path(conn, :index))
  end
end
