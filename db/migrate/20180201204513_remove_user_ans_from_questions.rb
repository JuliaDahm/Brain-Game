class RemoveUserAnsFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :user_ans, :text
  end
end
