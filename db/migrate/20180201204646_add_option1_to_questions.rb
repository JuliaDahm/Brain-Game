class AddOption1ToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :option1, :text
  end
end
