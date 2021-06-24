defmodule Cutme.Repo do
  use Ecto.Repo,
    otp_app: :cutme,
    adapter: Ecto.Adapters.Postgres
end
