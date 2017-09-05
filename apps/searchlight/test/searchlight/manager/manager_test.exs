defmodule Searchlight.ManagerTest do
  use Searchlight.DataCase

  alias Searchlight.Manager

  describe "accounts" do
    alias Searchlight.Manager.Account

    @valid_attrs %{access_token: "some access_token", client_id: "some client_id", client_secret: "some client_secret", description: "some description", enabled: true, name: "some name", shard: "some shard"}
    @update_attrs %{access_token: "some updated access_token", client_id: "some updated client_id", client_secret: "some updated client_secret", description: "some updated description", enabled: false, name: "some updated name", shard: "some updated shard"}
    @invalid_attrs %{access_token: nil, client_id: nil, client_secret: nil, description: nil, enabled: nil, name: nil, shard: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manager.create_account()

      account
    end

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Manager.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Manager.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Manager.create_account(@valid_attrs)
      assert account.access_token == "some access_token"
      assert account.client_id == "some client_id"
      assert account.client_secret == "some client_secret"
      assert account.description == "some description"
      assert account.enabled == true
      assert account.name == "some name"
      assert account.shard == "some shard"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manager.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, account} = Manager.update_account(account, @update_attrs)
      assert %Account{} = account
      assert account.access_token == "some updated access_token"
      assert account.client_id == "some updated client_id"
      assert account.client_secret == "some updated client_secret"
      assert account.description == "some updated description"
      assert account.enabled == false
      assert account.name == "some updated name"
      assert account.shard == "some updated shard"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Manager.update_account(account, @invalid_attrs)
      assert account == Manager.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Manager.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Manager.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Manager.change_account(account)
    end
  end

  describe "devices" do
    alias Searchlight.Manager.Device

    @valid_attrs %{capabilities: [], device_uuid: "some device_uuid", display_name: "some display_name", label: "some label", type: "some type"}
    @update_attrs %{capabilities: [], device_uuid: "some updated device_uuid", display_name: "some updated display_name", label: "some updated label", type: "some updated type"}
    @invalid_attrs %{capabilities: nil, device_uuid: nil, display_name: nil, label: nil, type: nil}

    def device_fixture(attrs \\ %{}) do
      {:ok, device} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manager.create_device()

      device
    end

    test "list_devices/0 returns all devices" do
      device = device_fixture()
      assert Manager.list_devices() == [device]
    end

    test "get_device!/1 returns the device with given id" do
      device = device_fixture()
      assert Manager.get_device!(device.id) == device
    end

    test "create_device/1 with valid data creates a device" do
      assert {:ok, %Device{} = device} = Manager.create_device(@valid_attrs)
      assert device.capabilities == []
      assert device.device_uuid == "some device_uuid"
      assert device.display_name == "some display_name"
      assert device.label == "some label"
      assert device.type == "some type"
    end

    test "create_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manager.create_device(@invalid_attrs)
    end

    test "update_device/2 with valid data updates the device" do
      device = device_fixture()
      assert {:ok, device} = Manager.update_device(device, @update_attrs)
      assert %Device{} = device
      assert device.capabilities == []
      assert device.device_uuid == "some updated device_uuid"
      assert device.display_name == "some updated display_name"
      assert device.label == "some updated label"
      assert device.type == "some updated type"
    end

    test "update_device/2 with invalid data returns error changeset" do
      device = device_fixture()
      assert {:error, %Ecto.Changeset{}} = Manager.update_device(device, @invalid_attrs)
      assert device == Manager.get_device!(device.id)
    end

    test "delete_device/1 deletes the device" do
      device = device_fixture()
      assert {:ok, %Device{}} = Manager.delete_device(device)
      assert_raise Ecto.NoResultsError, fn -> Manager.get_device!(device.id) end
    end

    test "change_device/1 returns a device changeset" do
      device = device_fixture()
      assert %Ecto.Changeset{} = Manager.change_device(device)
    end
  end

  describe "devices" do
    alias Searchlight.Manager.Device

    @valid_attrs %{capabilities: [], device_type: "some device_type", device_uuid: "some device_uuid", display_name: "some display_name", label: "some label"}
    @update_attrs %{capabilities: [], device_type: "some updated device_type", device_uuid: "some updated device_uuid", display_name: "some updated display_name", label: "some updated label"}
    @invalid_attrs %{capabilities: nil, device_type: nil, device_uuid: nil, display_name: nil, label: nil}

    def device_fixture(attrs \\ %{}) do
      {:ok, device} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manager.create_device()

      device
    end

    test "list_devices/0 returns all devices" do
      device = device_fixture()
      assert Manager.list_devices() == [device]
    end

    test "get_device!/1 returns the device with given id" do
      device = device_fixture()
      assert Manager.get_device!(device.id) == device
    end

    test "create_device/1 with valid data creates a device" do
      assert {:ok, %Device{} = device} = Manager.create_device(@valid_attrs)
      assert device.capabilities == []
      assert device.device_type == "some device_type"
      assert device.device_uuid == "some device_uuid"
      assert device.display_name == "some display_name"
      assert device.label == "some label"
    end

    test "create_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manager.create_device(@invalid_attrs)
    end

    test "update_device/2 with valid data updates the device" do
      device = device_fixture()
      assert {:ok, device} = Manager.update_device(device, @update_attrs)
      assert %Device{} = device
      assert device.capabilities == []
      assert device.device_type == "some updated device_type"
      assert device.device_uuid == "some updated device_uuid"
      assert device.display_name == "some updated display_name"
      assert device.label == "some updated label"
    end

    test "update_device/2 with invalid data returns error changeset" do
      device = device_fixture()
      assert {:error, %Ecto.Changeset{}} = Manager.update_device(device, @invalid_attrs)
      assert device == Manager.get_device!(device.id)
    end

    test "delete_device/1 deletes the device" do
      device = device_fixture()
      assert {:ok, %Device{}} = Manager.delete_device(device)
      assert_raise Ecto.NoResultsError, fn -> Manager.get_device!(device.id) end
    end

    test "change_device/1 returns a device changeset" do
      device = device_fixture()
      assert %Ecto.Changeset{} = Manager.change_device(device)
    end
  end
end
