class RemovePointsFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :points, :integer
  end
end
