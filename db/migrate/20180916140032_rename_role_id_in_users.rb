class RenameRoleIdInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :role_id, :role_record_id
  end
end
