defmodule Searchlight.ManagerTest do
  use Searchlight.DataCase

  alias Searchlight.Manager

  describe "servers" do
    alias Searchlight.Manager.Server

    @valid_attrs %{ip: "some ip", name: "some name"}
    @update_attrs %{ip: "some updated ip", name: "some updated name"}
    @invalid_attrs %{ip: nil, name: nil}

    def server_fixture(attrs \\ %{}) do
      {:ok, server} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manager.create_server()

      server
    end

    test "list_servers/0 returns all servers" do
      server = server_fixture()
      assert Manager.list_servers() == [server]
    end

    test "get_server!/1 returns the server with given id" do
      server = server_fixture()
      assert Manager.get_server!(server.id) == server
    end

    test "create_server/1 with valid data creates a server" do
      assert {:ok, %Server{} = server} = Manager.create_server(@valid_attrs)
      assert server.ip == "some ip"
      assert server.name == "some name"
    end

    test "create_server/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manager.create_server(@invalid_attrs)
    end

    test "update_server/2 with valid data updates the server" do
      server = server_fixture()
      assert {:ok, server} = Manager.update_server(server, @update_attrs)
      assert %Server{} = server
      assert server.ip == "some updated ip"
      assert server.name == "some updated name"
    end

    test "update_server/2 with invalid data returns error changeset" do
      server = server_fixture()
      assert {:error, %Ecto.Changeset{}} = Manager.update_server(server, @invalid_attrs)
      assert server == Manager.get_server!(server.id)
    end

    test "delete_server/1 deletes the server" do
      server = server_fixture()
      assert {:ok, %Server{}} = Manager.delete_server(server)
      assert_raise Ecto.NoResultsError, fn -> Manager.get_server!(server.id) end
    end

    test "change_server/1 returns a server changeset" do
      server = server_fixture()
      assert %Ecto.Changeset{} = Manager.change_server(server)
    end
  end

  describe "server_types" do
    alias Searchlight.Manager.ServerType

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def server_type_fixture(attrs \\ %{}) do
      {:ok, server_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manager.create_server_type()

      server_type
    end

    test "list_server_types/0 returns all server_types" do
      server_type = server_type_fixture()
      assert Manager.list_server_types() == [server_type]
    end

    test "get_server_type!/1 returns the server_type with given id" do
      server_type = server_type_fixture()
      assert Manager.get_server_type!(server_type.id) == server_type
    end

    test "create_server_type/1 with valid data creates a server_type" do
      assert {:ok, %ServerType{} = server_type} = Manager.create_server_type(@valid_attrs)
      assert server_type.description == "some description"
      assert server_type.name == "some name"
    end

    test "create_server_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manager.create_server_type(@invalid_attrs)
    end

    test "update_server_type/2 with valid data updates the server_type" do
      server_type = server_type_fixture()
      assert {:ok, server_type} = Manager.update_server_type(server_type, @update_attrs)
      assert %ServerType{} = server_type
      assert server_type.description == "some updated description"
      assert server_type.name == "some updated name"
    end

    test "update_server_type/2 with invalid data returns error changeset" do
      server_type = server_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Manager.update_server_type(server_type, @invalid_attrs)
      assert server_type == Manager.get_server_type!(server_type.id)
    end

    test "delete_server_type/1 deletes the server_type" do
      server_type = server_type_fixture()
      assert {:ok, %ServerType{}} = Manager.delete_server_type(server_type)
      assert_raise Ecto.NoResultsError, fn -> Manager.get_server_type!(server_type.id) end
    end

    test "change_server_type/1 returns a server_type changeset" do
      server_type = server_type_fixture()
      assert %Ecto.Changeset{} = Manager.change_server_type(server_type)
    end
  end
end
