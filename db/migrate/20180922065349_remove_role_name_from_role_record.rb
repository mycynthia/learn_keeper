class RemoveRoleNameFromRoleRecord < ActiveRecord::Migration[5.2]
  def change
    remove_column :role_records, :role_name, :string
  end
end
