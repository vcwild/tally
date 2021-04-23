# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tally,
  ecto_repos: [Tally.Repo]

config :tally, Tally.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :tally, Tally.Mailer, adapter: Bamboo.LocalAdapter

# Configures the endpoint
config :tally, TallyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xhEt1Mfwfpp9+7EGQLZoZs3MacvS9rOIOc6Q/Ymp9qyOQdg3vtpGlGG4XZsaGAnq",
  render_errors: [view: TallyWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Tally.PubSub,
  live_view: [signing_salt: "5mv1qjxA"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
