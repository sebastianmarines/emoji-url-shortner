defmodule Cutme.Links.Url do
  use Ecto.Schema
  import Ecto.Changeset

  @regex Regex.compile!(
           "([-a-zA-Z0-9^\p{L}\p{C}\u00a1-\uffff@:%_\+.~#?&//=]{2,256}){1}(\.[a-z]{2,4}){1}(\:[0-9]*)?(\/[-a-zA-Z0-9\u00a1-\uffff\(\)@:%,_\+.~#?&//=]*)?([-a-zA-Z0-9\(\)@:%,_\+.~#?&//=]*)?"
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
