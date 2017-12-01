class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :user_id
      t.integer :correct_answer_id
      t.integer :points
      t.string :tags, array: true, default: []

      t.timestamps
    end
  end
end
