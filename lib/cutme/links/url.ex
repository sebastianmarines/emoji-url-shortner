defmodule Cutme.Links.Url do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :link, EctoFields.URL
    field :short_url, :string

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:link, :short_url])
    |> validate_required([:link, :short_url])
    |> unique_constraint(:short_url)
  end
end
