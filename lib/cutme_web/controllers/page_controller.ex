defmodule CutmeWeb.PageController do
  use CutmeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
