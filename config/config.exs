# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cutme,
  ecto_repos: [Cutme.Repo]

# Configures the endpoint
config :cutme, CutmeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "20JKuQzTjthYNyNzP54kdkQq2m9GAOjXP0pz858XzrRwWybmseXgSliX6aXKwo6u",
  render_errors: [view: CutmeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Cutme.PubSub,
  live_view: [signing_salt: "YvW+/7p5"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
