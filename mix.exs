defmodule RummageEctoExample.Mixfile do
  use Mix.Project

  def project do
    [app: :rummage_ecto_example,
     version: "0.2.0",
     elixir: "~> 1.6.5",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :ecto, :postgrex]]
  end

  defp deps do
    [
      {:postgrex, ">= 0.0.0"},
      {:rummage_ecto, "~> 2.0.0-rc.0"}
    ]
  end
end
