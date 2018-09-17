class CreateEventRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :event_records do |t|
      t.integer :user_id
      t.integer :event_id
      t.timestamps
    end
  end
end
