class RemoveAccidentModel < ActiveRecord::Migration[5.0]
  def up
    drop_table :fake_answer_ones
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
