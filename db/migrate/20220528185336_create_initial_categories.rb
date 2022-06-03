class CreateInitialCategories < ActiveRecord::Migration[6.0]
  def change
    Category.create(name: "Amor")
    Category.create(name: "Tristeza")
    Category.create(name: "Felicidade")
  end
end
