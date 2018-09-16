class CreateRoleRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :role_records do |t|
      t.string :role_name
      t.timestamps
    end
  end
end
