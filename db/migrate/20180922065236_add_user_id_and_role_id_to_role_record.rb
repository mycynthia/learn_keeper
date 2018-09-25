class AddUserIdAndRoleIdToRoleRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :role_records, :user_id, :integer, first: true
    add_column :role_records, :role_id, :integer, before: :user_id
  end
end
