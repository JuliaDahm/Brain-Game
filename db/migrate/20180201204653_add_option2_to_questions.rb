class AddOption2ToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :option2, :text
  end
end
