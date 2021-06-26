defmodule Cutme.Links do
  @moduledoc """
  The Links context.
  """

  import Ecto.Query, warn: false
  alias Cutme.Repo

  alias Cutme.Links.Url

  @doc """
  Returns the list of urls.

  ## Examples

      iex> list_urls()
      [%Url{}, ...]

  """
  def list_urls do
    Repo.all(Url)
  end

  @doc """
  Gets a single url.

  Raises `Ecto.NoResultsError` if the Url does not exist.

  ## Examples

      iex> get_url!(123)
      %Url{}

      iex> get_url!(456)
      ** (Ecto.NoResultsError)

  """
  def get_url!(short_url), do: Repo.get_by!(Url, short_url: short_url)

  @doc """
  Creates a url.

  ## Examples

      iex> create_url(%{field: value})
      {:ok, %Url{}}

      iex> create_url(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_url(%Url{} = url) do
    Url.changeset(url, %{})
  end

  def create_url(attrs) do
    url = Map.merge(attrs, generate_short_url())

    changeset =
      %Url{}
      |> Url.changeset(url)
      |> Repo.insert()

    case changeset do
      {:ok, _} ->
        changeset

      {:error, bad_changeset} ->
        short_url_is_taken = Enum.any?(bad_changeset.errors, &short_url_taken?/1)

        if short_url_is_taken do
          create_url(attrs)
        else
          bad_changeset
        end
    end
  end

  def generate_short_url do
    emoji_url =
      Stream.repeatedly(fn -> Enum.random(Exmoji.all()) end)
      |> Enum.take(4)
      |> Enum.map(fn char -> Map.get(char, :unified) end)
      |> Enum.map(fn char -> Exmoji.unified_to_char(char) end)
      |> Enum.reduce("", fn x, acc -> acc <> x end)

    Map.put(%{}, :short_url, emoji_url)
  end

  def short_url_taken?({:short_url, _}), do: true
  def short_url_taken?(_), do: false
end
