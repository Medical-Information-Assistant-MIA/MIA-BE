class RenameType2ToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_column :health_events, :type, :category
  end
end
