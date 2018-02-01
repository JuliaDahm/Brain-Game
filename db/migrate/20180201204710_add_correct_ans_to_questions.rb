class AddCorrectAnsToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :correct_ans, :text
  end
end
