defmodule SearchlightWeb.DashboardController do
  use SearchlightWeb, :controller

  alias Searchlight.DashManager
  alias Searchlight.DashManager.Dashboard

  def index(conn, _params) do
    dashboards = DashManager.list_dashboards()
    render(conn, "index.html", dashboards: dashboards)
  end

  def new(conn, _params) do
    changeset = DashManager.change_dashboard(%Dashboard{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dashboard" => dashboard_params}) do
    case DashManager.create_dashboard(dashboard_params) do
      {:ok, dashboard} ->
        conn
        |> put_flash(:info, "Dashboard created successfully.")
        |> redirect(to: dashboard_path(conn, :show, dashboard))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dashboard = DashManager.get_dashboard!(id)
    render(conn, "show.html", dashboard: dashboard)
  end

  def edit(conn, %{"id" => id}) do
    dashboard = DashManager.get_dashboard!(id)
    changeset = DashManager.change_dashboard(dashboard)
    render(conn, "edit.html", dashboard: dashboard, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dashboard" => dashboard_params}) do
    dashboard = DashManager.get_dashboard!(id)

    case DashManager.update_dashboard(dashboard, dashboard_params) do
      {:ok, dashboard} ->
        conn
        |> put_flash(:info, "Dashboard updated successfully.")
        |> redirect(to: dashboard_path(conn, :show, dashboard))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", dashboard: dashboard, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dashboard = DashManager.get_dashboard!(id)
    {:ok, _dashboard} = DashManager.delete_dashboard(dashboard)

    conn
    |> put_flash(:info, "Dashboard deleted successfully.")
    |> redirect(to: dashboard_path(conn, :index))
  end
end
