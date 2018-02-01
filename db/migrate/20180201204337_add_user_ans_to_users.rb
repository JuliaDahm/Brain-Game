class AddUserAnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_ans, :text
  end
end
