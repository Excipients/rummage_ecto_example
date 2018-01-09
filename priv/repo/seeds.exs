alias RummageEctoExample.{Repo, Category, Product}

# Starting the app to start the Repo
Mix.Task.run "app.start", []
Repo.start_link()

# Populates the database with 4 Categories, each has a parent besides the
# first one.
# Also Populates the databases with 8 Products, 2 each for a category.
for x <- 1..4 do
  parent = Repo.get_by(Category, category_name: "Category #{x-1}")

  category = Repo.insert!(%Category{category_name: "Category #{x}",
    category_id: parent && parent.id})

  for x <- 1..2 do
    Repo.insert!(%Product{name: "Product #{x}", price: 10.0 * x,
      available: x == 2,
      category_id: category.id})
  end
end
