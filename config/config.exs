# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :simpawa,
  ecto_repos: [Simpawa.Repo]

# Configures the endpoint
config :simpawa, Simpawa.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q6+fgqaJsXOm4NAeAX6ZgyNARCG8jNKkRIIsfHUamuyzAxjRKNMspUJAwQKj8fDU",
  render_errors: [view: Simpawa.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Simpawa.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  ttl: { 1, :days },
  secret_key: <guardian secret key>