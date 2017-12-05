class ChangeScoreDefault < ActiveRecord::Migration[5.0]
  def up
    # Set default value
    change_column_default :users, :score, 0
  end
end
