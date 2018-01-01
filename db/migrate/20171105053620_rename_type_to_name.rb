class RenameTypeToName < ActiveRecord::Migration[5.1]
  def change
    rename_column :tasks, :type, :name
  end
end
