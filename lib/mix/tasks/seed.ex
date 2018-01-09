defmodule Mix.Tasks.Seed do
  use Mix.Task

  def run(_) do
    Mix.Task.run "app.start", []
    seed(Mix.env)
  end

  def seed(:dev) do
    Mix.Task.run "run priv/repo/seeds.exs"
  end
end
