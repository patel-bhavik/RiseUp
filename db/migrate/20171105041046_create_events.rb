class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :desc
      t.integer :points_needed
      t.string :event_img

      t.timestamps
    end
  end
end
