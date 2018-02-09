class AddUserAnswerToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :user_ans, :text
  end
end
