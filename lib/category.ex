defmodule RummageEctoExample.Category do
  use Ecto.Schema
  use Rummage.Ecto, per_page: 10

  schema "categories" do
    field :category_name, :string

    belongs_to :category, RummageEctoExample.Category

    timestamps()
  end
end
