# RummageEctoExample

This app demonstrates the usage of `Rummage.Ecto`

## Setup

- Git clone the repository
- Install languages:
  - Install elixir 1.4.5
  - Install erlang 20.1
  - Use `$ asdf install elixir 1.4.5`
  - Use `$ asdf install erlang 20.1`
- `$ mix.deps.get`

- Make sure you have environment variables defined for:
  - `POSTGRES_USER`
  - `POSTGRES_PASSWORD`

- `$ mix ecto.create`
- `$ mix ecto.migrate`


- To seed the data: (from application's root directory)
  - `$ mix run priv/repo/seeds.exs`

- Start up a console and play with `rummage_ecto`
