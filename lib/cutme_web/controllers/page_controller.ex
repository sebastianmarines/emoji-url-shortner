defmodule CutmeWeb.PageController do
  use CutmeWeb, :controller

  alias Cutme.Links
  alias Cutme.Links.Url

  def index(conn, _params) do
    changeset = Links.create_url(%Url{})
    render(conn, "index.html", [changeset: changeset, shortened_url: ""])
  end

  def create(conn, %{"url" => link}) do
    changeset = Links.create_url(%Url{})
    {:ok, url} = Links.create_url(%{link: Map.get(link, "link")})

    render(conn, "index.html", [changeset: changeset, shortened_url: url.short_url])
  end

  def show(conn, %{"url" => url}) do
    try do
      %{link: link} = Links.get_url!(url)
      redirect(conn, external: link)
    rescue
      _ in Ecto.NoResultsError ->
        conn
        |> put_flash(:error, "This link does not exist")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end
end
