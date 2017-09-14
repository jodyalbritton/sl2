defmodule Searchlight.DashManagerTest do
  use Searchlight.DataCase

  alias Searchlight.DashManager

  describe "dashboards" do
    alias Searchlight.DashManager.Dashboard

    @valid_attrs %{default: true, name: "some name", settings: %{}, shareable: true}
    @update_attrs %{default: false, name: "some updated name", settings: %{}, shareable: false}
    @invalid_attrs %{default: nil, name: nil, settings: nil, shareable: nil}

    def dashboard_fixture(attrs \\ %{}) do
      {:ok, dashboard} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DashManager.create_dashboard()

      dashboard
    end

    test "list_dashboards/0 returns all dashboards" do
      dashboard = dashboard_fixture()
      assert DashManager.list_dashboards() == [dashboard]
    end

    test "get_dashboard!/1 returns the dashboard with given id" do
      dashboard = dashboard_fixture()
      assert DashManager.get_dashboard!(dashboard.id) == dashboard
    end

    test "create_dashboard/1 with valid data creates a dashboard" do
      assert {:ok, %Dashboard{} = dashboard} = DashManager.create_dashboard(@valid_attrs)
      assert dashboard.default == true
      assert dashboard.name == "some name"
      assert dashboard.settings == %{}
      assert dashboard.shareable == true
    end

    test "create_dashboard/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DashManager.create_dashboard(@invalid_attrs)
    end

    test "update_dashboard/2 with valid data updates the dashboard" do
      dashboard = dashboard_fixture()
      assert {:ok, dashboard} = DashManager.update_dashboard(dashboard, @update_attrs)
      assert %Dashboard{} = dashboard
      assert dashboard.default == false
      assert dashboard.name == "some updated name"
      assert dashboard.settings == %{}
      assert dashboard.shareable == false
    end

    test "update_dashboard/2 with invalid data returns error changeset" do
      dashboard = dashboard_fixture()
      assert {:error, %Ecto.Changeset{}} = DashManager.update_dashboard(dashboard, @invalid_attrs)
      assert dashboard == DashManager.get_dashboard!(dashboard.id)
    end

    test "delete_dashboard/1 deletes the dashboard" do
      dashboard = dashboard_fixture()
      assert {:ok, %Dashboard{}} = DashManager.delete_dashboard(dashboard)
      assert_raise Ecto.NoResultsError, fn -> DashManager.get_dashboard!(dashboard.id) end
    end

    test "change_dashboard/1 returns a dashboard changeset" do
      dashboard = dashboard_fixture()
      assert %Ecto.Changeset{} = DashManager.change_dashboard(dashboard)
    end
  end
end
