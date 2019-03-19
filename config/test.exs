use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :probandoPhoenixLiveView, ProbandoPhoenixLiveViewWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :probandoPhoenixLiveView, ProbandoPhoenixLiveView.Repo,
  username: "postgres",
  password: "postgres",
  database: "probandophoenixliveview_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
