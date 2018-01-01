class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.integer :donation_amount

      t.timestamps
    end
  end
end
