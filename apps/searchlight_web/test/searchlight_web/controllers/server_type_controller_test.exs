defmodule SearchlightWeb.ServerTypeControllerTest do
  use SearchlightWeb.ConnCase

  alias Searchlight.Manager

  @create_attrs %{description: "some description", name: "some name"}
  @update_attrs %{description: "some updated description", name: "some updated name"}
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:server_type) do
    {:ok, server_type} = Manager.create_server_type(@create_attrs)
    server_type
  end

  describe "index" do
    test "lists all server_types", %{conn: conn} do
      conn = get conn, server_type_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Server types"
    end
  end

  describe "new server_type" do
    test "renders form", %{conn: conn} do
      conn = get conn, server_type_path(conn, :new)
      assert html_response(conn, 200) =~ "New Server type"
    end
  end

  describe "create server_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, server_type_path(conn, :create), server_type: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == server_type_path(conn, :show, id)

      conn = get conn, server_type_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Server type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, server_type_path(conn, :create), server_type: @invalid_attrs
      assert html_response(conn, 200) =~ "New Server type"
    end
  end

  describe "edit server_type" do
    setup [:create_server_type]

    test "renders form for editing chosen server_type", %{conn: conn, server_type: server_type} do
      conn = get conn, server_type_path(conn, :edit, server_type)
      assert html_response(conn, 200) =~ "Edit Server type"
    end
  end

  describe "update server_type" do
    setup [:create_server_type]

    test "redirects when data is valid", %{conn: conn, server_type: server_type} do
      conn = put conn, server_type_path(conn, :update, server_type), server_type: @update_attrs
      assert redirected_to(conn) == server_type_path(conn, :show, server_type)

      conn = get conn, server_type_path(conn, :show, server_type)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, server_type: server_type} do
      conn = put conn, server_type_path(conn, :update, server_type), server_type: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Server type"
    end
  end

  describe "delete server_type" do
    setup [:create_server_type]

    test "deletes chosen server_type", %{conn: conn, server_type: server_type} do
      conn = delete conn, server_type_path(conn, :delete, server_type)
      assert redirected_to(conn) == server_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, server_type_path(conn, :show, server_type)
      end
    end
  end

  defp create_server_type(_) do
    server_type = fixture(:server_type)
    {:ok, server_type: server_type}
  end
end
