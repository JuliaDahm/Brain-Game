class AddUsernameToUsers < ActiveRecord::Migration[5.0]
  add_column :users, :username, :string
end
