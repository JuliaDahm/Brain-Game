class AddUidToUsers < ActiveRecord::Migration[5.0]
  add_column :users, :uid, :string
end
