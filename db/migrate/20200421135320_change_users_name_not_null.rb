class ChangeUsersNameNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :name, :string, null: false
    change_column :users, :email, :string, null: false
  end
  def down
    change_column :users, :name, :string
    change_column :users, :email, :string
  end
end
