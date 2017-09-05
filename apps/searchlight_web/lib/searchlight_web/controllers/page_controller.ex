defmodule SearchlightWeb.PageController do
  use SearchlightWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
