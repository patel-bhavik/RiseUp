class AddPointsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :total_points, :integer
  end
end
