# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :searchlight_web,
  namespace: SearchlightWeb,
  ecto_repos: [Searchlight.Repo]

# Configures the endpoint
config :searchlight_web, SearchlightWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eu7UO9cU94a+K+m33PsC2E4y7BmZTey5pmH1CnKCTxx0lve/JxH8XpfirJVEA0sC",
  render_errors: [view: SearchlightWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SearchlightWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :searchlight_web, :generators,
  context_app: :searchlight

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
