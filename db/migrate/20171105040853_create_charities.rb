class CreateCharities < ActiveRecord::Migration[5.1]
  def change
    create_table :charities do |t|
      t.string :name
      t.string :cust_id
      t.string :acc_id
      t.float :balance

      t.timestamps
    end
  end
end
