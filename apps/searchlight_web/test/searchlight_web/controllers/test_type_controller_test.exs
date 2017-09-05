defmodule SearchlightWeb.TestTypeControllerTest do
  use SearchlightWeb.ConnCase

  alias Searchlight.TestManager

  @create_attrs %{description: "some description", name: "some name"}
  @update_attrs %{description: "some updated description", name: "some updated name"}
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:test_type) do
    {:ok, test_type} = TestManager.create_test_type(@create_attrs)
    test_type
  end

  describe "index" do
    test "lists all test_types", %{conn: conn} do
      conn = get conn, test_type_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Test types"
    end
  end

  describe "new test_type" do
    test "renders form", %{conn: conn} do
      conn = get conn, test_type_path(conn, :new)
      assert html_response(conn, 200) =~ "New Test type"
    end
  end

  describe "create test_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, test_type_path(conn, :create), test_type: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == test_type_path(conn, :show, id)

      conn = get conn, test_type_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Test type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, test_type_path(conn, :create), test_type: @invalid_attrs
      assert html_response(conn, 200) =~ "New Test type"
    end
  end

  describe "edit test_type" do
    setup [:create_test_type]

    test "renders form for editing chosen test_type", %{conn: conn, test_type: test_type} do
      conn = get conn, test_type_path(conn, :edit, test_type)
      assert html_response(conn, 200) =~ "Edit Test type"
    end
  end

  describe "update test_type" do
    setup [:create_test_type]

    test "redirects when data is valid", %{conn: conn, test_type: test_type} do
      conn = put conn, test_type_path(conn, :update, test_type), test_type: @update_attrs
      assert redirected_to(conn) == test_type_path(conn, :show, test_type)

      conn = get conn, test_type_path(conn, :show, test_type)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, test_type: test_type} do
      conn = put conn, test_type_path(conn, :update, test_type), test_type: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Test type"
    end
  end

  describe "delete test_type" do
    setup [:create_test_type]

    test "deletes chosen test_type", %{conn: conn, test_type: test_type} do
      conn = delete conn, test_type_path(conn, :delete, test_type)
      assert redirected_to(conn) == test_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, test_type_path(conn, :show, test_type)
      end
    end
  end

  defp create_test_type(_) do
    test_type = fixture(:test_type)
    {:ok, test_type: test_type}
  end
end
