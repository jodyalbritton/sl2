use Mix.Config

# Configure your database
config :searchlight, Searchlight.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "searchlight_dev",
  hostname: "localhost",
  pool_size: 10
