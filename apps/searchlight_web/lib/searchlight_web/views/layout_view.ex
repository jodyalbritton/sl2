defmodule SearchlightWeb.LayoutView do
  use SearchlightWeb, :view

  def get_active_link(conn, action, path) do
    target_path = List.first(conn.path_info)
    if action_name(conn) == action do
      if  target_path == path do
        "navigation__active"
      end
    else
      nil
    end
  end
end
