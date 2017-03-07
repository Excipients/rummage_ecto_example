defmodule RummageEctoExample.Category do
  use Ecto.Schema
  use Rummage.Ecto

  schema "categories" do
    field :category_name, :string

    timestamps
  end
end
