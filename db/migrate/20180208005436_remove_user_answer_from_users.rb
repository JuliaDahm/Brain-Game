class RemoveUserAnswerFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :user_ans, :text
  end
end
