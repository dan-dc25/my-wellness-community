class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.text :instructions
      t.string :cook_time
      t.integer :user_id
      

      t.timestamps
    end
  end
end
