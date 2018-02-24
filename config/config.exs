# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :auth_login,
  ecto_repos: [AuthLogin.Repo]

# Configures the endpoint
config :auth_login, AuthLoginWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "acQH0ah+y/QCvqE/GDeoTZ1KgeA7zgmDRWFPr1Yp0utv5fKAt9O77zy1gJN22LRB",
  render_errors: [view: AuthLoginWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AuthLogin.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


config :auth_login, AuthLoginWeb.Auth.Guardian,
       issuer: "auth_login",
       secret_key: "NsWAKxYBOIQPB5BMRpFUKQTny2mrsBU4vd9GQi+SxmRWEdfeiXhUfl++6hNe3RSJ"