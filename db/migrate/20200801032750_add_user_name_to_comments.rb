class AddUserNameToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_name, :integer
  end
end
