class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :dish
      t.text :material
      t.text :recipe
      t.timestamps
    end
  end
end
