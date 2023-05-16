class RenameTypeToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_column :doctors, :type, :category
  end
end
