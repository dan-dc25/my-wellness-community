class CreateCookbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cookbooks do |t|
      t.string :name
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
