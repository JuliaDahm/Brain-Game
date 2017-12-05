class AddScoreToUsers < ActiveRecord::Migration[5.0]
  add_column :users, :score, :integer
end
