defmodule CutmeWeb.PageController do
  use CutmeWeb, :controller

  alias Cutme.Links
  alias Cutme.Links.Url

  def index(conn, _params) do
    changeset = Links.create_url(%Url{})
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"url" => link}) do
    changeset = Links.create_url(%Url{})

    case Links.create_url(%{link: Map.get(link, "link")}) do
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset)

      {:ok, url} ->
        render(conn, "index.html", changeset: changeset, shortened_url: url.short_url)
    end
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
