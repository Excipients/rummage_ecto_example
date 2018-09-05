defmodule RummageEctoExample.Category do
  use Ecto.Schema
  use Rummage.Ecto.Schema

  schema "categories" do
    field :name, :string
    field :description, :string

    belongs_to :parent_category, __MODULE__

    timestamps()
  end
end
