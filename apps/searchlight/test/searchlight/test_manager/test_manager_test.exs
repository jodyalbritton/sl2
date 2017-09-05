defmodule Searchlight.TestManagerTest do
  use Searchlight.DataCase

  alias Searchlight.TestManager

  describe "test_types" do
    alias Searchlight.TestManager.TestType

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def test_type_fixture(attrs \\ %{}) do
      {:ok, test_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TestManager.create_test_type()

      test_type
    end

    test "list_test_types/0 returns all test_types" do
      test_type = test_type_fixture()
      assert TestManager.list_test_types() == [test_type]
    end

    test "get_test_type!/1 returns the test_type with given id" do
      test_type = test_type_fixture()
      assert TestManager.get_test_type!(test_type.id) == test_type
    end

    test "create_test_type/1 with valid data creates a test_type" do
      assert {:ok, %TestType{} = test_type} = TestManager.create_test_type(@valid_attrs)
      assert test_type.description == "some description"
      assert test_type.name == "some name"
    end

    test "create_test_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TestManager.create_test_type(@invalid_attrs)
    end

    test "update_test_type/2 with valid data updates the test_type" do
      test_type = test_type_fixture()
      assert {:ok, test_type} = TestManager.update_test_type(test_type, @update_attrs)
      assert %TestType{} = test_type
      assert test_type.description == "some updated description"
      assert test_type.name == "some updated name"
    end

    test "update_test_type/2 with invalid data returns error changeset" do
      test_type = test_type_fixture()
      assert {:error, %Ecto.Changeset{}} = TestManager.update_test_type(test_type, @invalid_attrs)
      assert test_type == TestManager.get_test_type!(test_type.id)
    end

    test "delete_test_type/1 deletes the test_type" do
      test_type = test_type_fixture()
      assert {:ok, %TestType{}} = TestManager.delete_test_type(test_type)
      assert_raise Ecto.NoResultsError, fn -> TestManager.get_test_type!(test_type.id) end
    end

    test "change_test_type/1 returns a test_type changeset" do
      test_type = test_type_fixture()
      assert %Ecto.Changeset{} = TestManager.change_test_type(test_type)
    end
  end

  describe "tests" do
    alias Searchlight.TestManager.Test

    @valid_attrs %{configuration: %{}, current_iteration: 42, description: "some description", device_id_set: [], interation: 42, is_complete: "some is_complete", is_running: true, last_status_message: "some last_status_message", name: "some name", permissions: %{}, shareable: true, state: %{}, status: "some status"}
    @update_attrs %{configuration: %{}, current_iteration: 43, description: "some updated description", device_id_set: [], interation: 43, is_complete: "some updated is_complete", is_running: false, last_status_message: "some updated last_status_message", name: "some updated name", permissions: %{}, shareable: false, state: %{}, status: "some updated status"}
    @invalid_attrs %{configuration: nil, current_iteration: nil, description: nil, device_id_set: nil, interation: nil, is_complete: nil, is_running: nil, last_status_message: nil, name: nil, permissions: nil, shareable: nil, state: nil, status: nil}

    def test_fixture(attrs \\ %{}) do
      {:ok, test} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TestManager.create_test()

      test
    end

    test "list_tests/0 returns all tests" do
      test = test_fixture()
      assert TestManager.list_tests() == [test]
    end

    test "get_test!/1 returns the test with given id" do
      test = test_fixture()
      assert TestManager.get_test!(test.id) == test
    end

    test "create_test/1 with valid data creates a test" do
      assert {:ok, %Test{} = test} = TestManager.create_test(@valid_attrs)
      assert test.configuration == %{}
      assert test.current_iteration == 42
      assert test.description == "some description"
      assert test.device_id_set == []
      assert test.interation == 42
      assert test.is_complete == "some is_complete"
      assert test.is_running == true
      assert test.last_status_message == "some last_status_message"
      assert test.name == "some name"
      assert test.permissions == %{}
      assert test.shareable == true
      assert test.state == %{}
      assert test.status == "some status"
    end

    test "create_test/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TestManager.create_test(@invalid_attrs)
    end

    test "update_test/2 with valid data updates the test" do
      test = test_fixture()
      assert {:ok, test} = TestManager.update_test(test, @update_attrs)
      assert %Test{} = test
      assert test.configuration == %{}
      assert test.current_iteration == 43
      assert test.description == "some updated description"
      assert test.device_id_set == []
      assert test.interation == 43
      assert test.is_complete == "some updated is_complete"
      assert test.is_running == false
      assert test.last_status_message == "some updated last_status_message"
      assert test.name == "some updated name"
      assert test.permissions == %{}
      assert test.shareable == false
      assert test.state == %{}
      assert test.status == "some updated status"
    end

    test "update_test/2 with invalid data returns error changeset" do
      test = test_fixture()
      assert {:error, %Ecto.Changeset{}} = TestManager.update_test(test, @invalid_attrs)
      assert test == TestManager.get_test!(test.id)
    end

    test "delete_test/1 deletes the test" do
      test = test_fixture()
      assert {:ok, %Test{}} = TestManager.delete_test(test)
      assert_raise Ecto.NoResultsError, fn -> TestManager.get_test!(test.id) end
    end

    test "change_test/1 returns a test changeset" do
      test = test_fixture()
      assert %Ecto.Changeset{} = TestManager.change_test(test)
    end
  end
end
