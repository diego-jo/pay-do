# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pay_do,
  ecto_repos: [PayDo.Repo]

# Configures the endpoint
config :pay_do, PayDoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pWlV2+8tzpBRGgxAtnG9aMGR1cuuQq8xTUx4AJhOVgIc2wIvqAikXCZfK+pO18kB",
  render_errors: [view: PayDoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PayDo.PubSub,
  live_view: [signing_salt: "zR2p+plN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
