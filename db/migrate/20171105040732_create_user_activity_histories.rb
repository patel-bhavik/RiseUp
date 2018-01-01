class CreateUserActivityHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_activity_histories do |t|
      t.integer :points_earned

      t.timestamps
    end
  end
end
