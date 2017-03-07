defmodule RummageEctoExample.Product do
  use Ecto.Schema
  use Rummage.Ecto

  schema "products" do
    field :name, :string
    field :price, :float
    belongs_to :category, RummageEctoExample.Category

    timestamps
  end
end
