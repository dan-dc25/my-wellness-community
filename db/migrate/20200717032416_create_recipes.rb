class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.text :instructions
      t.string :cook_time
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
