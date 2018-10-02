class CreateLabelGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :label_groups do |t|
      t.integer :label_id
      t.integer :group_id
      t.timestamps
    end
  end
end
