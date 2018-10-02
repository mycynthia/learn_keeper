class RemoveGroupIdFromLabels < ActiveRecord::Migration[5.2]
  def change
    remove_column :labels, :group_id
  end
end
