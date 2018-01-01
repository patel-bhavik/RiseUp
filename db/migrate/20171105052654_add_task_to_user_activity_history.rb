class AddTaskToUserActivityHistory < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_activity_histories, :task, foreign_key: true
  end
end
