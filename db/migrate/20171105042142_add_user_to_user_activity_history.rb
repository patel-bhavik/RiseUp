class AddUserToUserActivityHistory < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_activity_histories, :user, foreign_key: true
  end
end
