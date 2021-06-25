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
  def create_url(attrs \\ %{}) do
    %Url{}
    |> Url.changeset(attrs)
    |> Repo.insert()
  end

  def generate_short_url(len \\ 4) do
    Stream.repeatedly(fn -> Enum.random(Exmoji.all) end)
    |> Enum.take(len)
    |> Enum.map(fn char -> Map.get(char, :unified) end)
    |> Enum.map(fn char -> Exmoji.unified_to_char(char) end)
    |> Enum.reduce("", fn x, acc -> acc <> x end)
  end
end
