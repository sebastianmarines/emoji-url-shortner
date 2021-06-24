defmodule Cutme.LinksTest do
  use Cutme.DataCase

  alias Cutme.Links

  describe "urls" do
    alias Cutme.Links.Url

    @valid_attrs %{link: "some link", short_url: "some short_url"}
    @update_attrs %{link: "some updated link", short_url: "some updated short_url"}
    @invalid_attrs %{link: nil, short_url: nil}

    def url_fixture(attrs \\ %{}) do
      {:ok, url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Links.create_url()

      url
    end

    test "list_urls/0 returns all urls" do
      url = url_fixture()
      assert Links.list_urls() == [url]
    end

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert Links.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      assert {:ok, %Url{} = url} = Links.create_url(@valid_attrs)
      assert url.link == "some link"
      assert url.short_url == "some short_url"
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Links.create_url(@invalid_attrs)
    end

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      assert {:ok, %Url{} = url} = Links.update_url(url, @update_attrs)
      assert url.link == "some updated link"
      assert url.short_url == "some updated short_url"
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = Links.update_url(url, @invalid_attrs)
      assert url == Links.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %Url{}} = Links.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> Links.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = Links.change_url(url)
    end
  end
end
