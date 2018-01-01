class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :type
      t.integer :points_per_mile

      t.timestamps
    end
  end
end
