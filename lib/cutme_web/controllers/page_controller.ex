defmodule CutmeWeb.PageController do
  use CutmeWeb, :controller

  alias Cutme.Links
  alias Cutme.Links.Url

  def index(conn, _params) do
    changeset = Links.create_url(%Url{})
    render(conn, "index.html", changeset: changeset)
  end

  def show(conn, %{"url" => url}) do
    # TODO handle 404
    %{link: link} = Links.get_url!(url)
    redirect(conn, external: link)
  end
end
