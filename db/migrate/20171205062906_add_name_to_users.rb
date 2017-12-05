class AddNameToUsers < ActiveRecord::Migration[5.0]
  add_column :users, :name, :string
end
