defmodule Cutme.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :link, :string
      add :short_url, :string

      timestamps()
    end

    create unique_index(:urls, [:short_url])
  end
end
