# RummageEctoExample

This app demonstrates the usage of `Rummage.Ecto`

This app currently uses `rummage_ecto, 1.3.0-rc.0`

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

## Things to Try out:

- Basic Rummage call:

```elixir
{query, rummage} = Product.rummage(%{paginate: %{per_page: 1, page: 2},
  sort: %{field: :name, order: :desc},
  search: %{name: %{search_type: :ilike, search_term: "product"}}})

Repo.all(query)
```

- Rummage call with association sort:

```elixir
{query, rummage} = Product.rummage(%{paginate: %{per_page: 10, page: 1},
  sort: %{field: :category_name, assoc: [inner: :category], order: :desc},
  search: %{name: %{search_type: :ilike, search_term: "product"}}})

Repo.all(query)
```

- Rummage call with association search:

```elixir
{query, rummage} = Product.rummage(%{paginate: %{per_page: 10, page: 1},
  sort: %{field: :category_name, assoc: [inner: :category], order: :desc},
  search: %{category_name: %{assoc: [inner: :category], search_type: :ilike,
    search_term: "1"}}})

Repo.all(query)
```

- Rummage call with nested associations search:

```elixir
{query, rummage} = Product.rummage(%{paginate: %{per_page: 10, page: 1},
  sort: %{field: :category_name, assoc: [inner: :category], order: :desc},
  search: %{category_name: %{assoc: [inner: :category, inner: :category], search_type: :ilike,
    search_term: "1"}}})

Repo.all(query)
```

- Rummage call with nested associations sort:

```elixir
{query, rummage} = Product.rummage(%{paginate: %{per_page: 10, page: 1},
  sort: %{field: :category_name, assoc: [inner: :category, inner: :category], order: :desc},
  search: %{name: %{search_type: :ilike, search_term: "product"}}})

Repo.all(query)
```

- Rummage call with custom hooks:

```elixir
opts = [paginate: Rummage.Ecto.CustomHooks.KeysetPaginate,
  sort: Rummage.Ecto.CustomHooks.SimpleSort,
  search: Rummage.Ecto.CustomHooks.SimpleSearch]

{query, rummage} = Product.rummage(%{paginate: %{per_page: 10, page: 1},
  sort: %{field: :name, order: :desc},
  search: %{name: %{search_type: :ilike, search_term: "1"}}}, opts)

Repo.all(query)
```
