defmodule Cutme.Links.Url do
  use Ecto.Schema
  import Ecto.Changeset

  @regex Regex.compile!(
           "^(https?:\/\/)?([\da-z\.-]+\.[a-z\.]{2,6}|[\d\.]+)([\/:?=&#]{1}[\da-z\.-]+)*[\/\?]?$"
         )

  schema "urls" do
    field :link, :string
    field :short_url, :string

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:link, :short_url])
    |> validate_required([:link, :short_url])
    |> validate_format(:link, @regex)
    |> unique_constraint(:short_url)
  end
end
