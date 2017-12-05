class AddProviderToUsers < ActiveRecord::Migration[5.0]
  add_column :users, :provider, :string
end
