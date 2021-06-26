defmodule CutmeWeb.PageController do
  use CutmeWeb, :controller

  alias Cutme.Links

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"url" => url}) do
    # TODO handle 404
    %{link: link} = Links.get_url!(url)
    redirect(conn, external: link)
  end
end
