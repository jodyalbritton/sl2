defmodule SearchlightWeb.AccountControllerTest do
  use SearchlightWeb.ConnCase

  alias Searchlight.Manager

  @create_attrs %{access_token: "some access_token", client_id: "some client_id", client_secret: "some client_secret", description: "some description", enabled: true, name: "some name", shard: "some shard"}
  @update_attrs %{access_token: "some updated access_token", client_id: "some updated client_id", client_secret: "some updated client_secret", description: "some updated description", enabled: false, name: "some updated name", shard: "some updated shard"}
  @invalid_attrs %{access_token: nil, client_id: nil, client_secret: nil, description: nil, enabled: nil, name: nil, shard: nil}

  def fixture(:account) do
    {:ok, account} = Manager.create_account(@create_attrs)
    account
  end

  describe "index" do
    test "lists all accounts", %{conn: conn} do
      conn = get conn, account_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Accounts"
    end
  end

  describe "new account" do
    test "renders form", %{conn: conn} do
      conn = get conn, account_path(conn, :new)
      assert html_response(conn, 200) =~ "New Account"
    end
  end

  describe "create account" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, account_path(conn, :create), account: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == account_path(conn, :show, id)

      conn = get conn, account_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Account"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, account_path(conn, :create), account: @invalid_attrs
      assert html_response(conn, 200) =~ "New Account"
    end
  end

  describe "edit account" do
    setup [:create_account]

    test "renders form for editing chosen account", %{conn: conn, account: account} do
      conn = get conn, account_path(conn, :edit, account)
      assert html_response(conn, 200) =~ "Edit Account"
    end
  end

  describe "update account" do
    setup [:create_account]

    test "redirects when data is valid", %{conn: conn, account: account} do
      conn = put conn, account_path(conn, :update, account), account: @update_attrs
      assert redirected_to(conn) == account_path(conn, :show, account)

      conn = get conn, account_path(conn, :show, account)
      assert html_response(conn, 200) =~ "some updated access_token"
    end

    test "renders errors when data is invalid", %{conn: conn, account: account} do
      conn = put conn, account_path(conn, :update, account), account: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Account"
    end
  end

  describe "delete account" do
    setup [:create_account]

    test "deletes chosen account", %{conn: conn, account: account} do
      conn = delete conn, account_path(conn, :delete, account)
      assert redirected_to(conn) == account_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, account_path(conn, :show, account)
      end
    end
  end

  defp create_account(_) do
    account = fixture(:account)
    {:ok, account: account}
  end
end
