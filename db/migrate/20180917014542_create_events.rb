class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :image
      t.text :contacts
      t.string :address
      t.datetime :datetime
      t.string :location
      t.integer :attendees_count
      t.integer :label_id
      t.timestamps
    end
  end
end
