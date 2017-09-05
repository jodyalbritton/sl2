use Mix.Config

# Configure your database
config :searchlight, Searchlight.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "searchlight_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
