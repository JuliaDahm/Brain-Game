class ChangePointsDefault < ActiveRecord::Migration[5.0]
  def up
    # Set default value
    change_column_default :questions, :points, 3
  end

  # def down
  #   # Remove default
  #   change_column_default :questions, :points, nil
  # end
end
