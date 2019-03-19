# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :probandoPhoenixLiveView,
  ecto_repos: [ProbandoPhoenixLiveView.Repo]

# Configures the endpoint
config :probandoPhoenixLiveView, ProbandoPhoenixLiveViewWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3aEJiEKfbRNriEyeT/yRGm81YkzL4GACSvl8DgxcJAlrtLsY69n6NzfkXWIiemrp",
  render_errors: [view: ProbandoPhoenixLiveViewWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ProbandoPhoenixLiveView.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "VpvwwmmbJ0uFns1NS4m1/Y5NRs2yv5vf"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
