class AddEventToDonations < ActiveRecord::Migration[5.1]
  def change
    add_reference :donations, :event, foreign_key: true
  end
end
