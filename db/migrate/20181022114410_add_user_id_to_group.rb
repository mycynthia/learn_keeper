class AddUserIdToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :user_id, :string
  end
end
