use Mix.Config

config :logger, :console,
  level: :error

# Rummage Config:
# Takes <app_name>, Rummage.Ecto, `repo`, `per_page` and
# hook overrides
config :rummage_ecto_example, Rummage.Ecto,
  repo: RummageEctoExample.Repo,
  per_page: 2

config :rummage_ecto_example, ecto_repos: [RummageEctoExample.Repo]

config :rummage_ecto_example, RummageEctoExample.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("POSTGRES_USERNAME"),
  password: System.get_env("POSTGRES_PASSWORD"),
  database: "rummage_ecto_example",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  timeout: :infinity
