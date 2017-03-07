for x <- 1..4 do
  category = %RummageEctoExample.Category{category_name: "Category #{x}"}
  |> RummageEctoExample.Repo.insert!

  for x <- 1..2 do
    %RummageEctoExample.Product{
      name: "Product #{x}",
      price: 10.0 * x,
      category_id: category.id
    } |> RummageEctoExample.Repo.insert!
  end
end
