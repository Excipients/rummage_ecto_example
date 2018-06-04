defmodule RummageEctoExample.Mixfile do
  use Mix.Project

  @elixir "~> 1.6"
  @vsn "2.0.0"

  def project do
    [app: :rummage_ecto_example,
     version: @vsn,
     elixir: @elixir,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  def application do
    [applications: [:logger, :ecto, :postgrex]]
  end

  defp deps do
    [
      {:postgrex, ">= 0.0.0"},
      # {:rummage_ecto, "~> 2.0.0-rc.0"}
      {:rummage_ecto, path: "../rummage_ecto"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.seed": ["run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.setup --quite", "test"],
    ]
  end
end
