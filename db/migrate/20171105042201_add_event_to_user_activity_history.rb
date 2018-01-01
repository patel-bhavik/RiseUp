class AddEventToUserActivityHistory < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_activity_histories, :event, foreign_key: true
  end
end
