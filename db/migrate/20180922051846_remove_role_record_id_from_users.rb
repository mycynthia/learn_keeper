class RemoveRoleRecordIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :Users, :role_record_id, :integer
  end
end
