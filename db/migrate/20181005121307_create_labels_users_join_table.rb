class CreateLabelsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :labels do |t|
      t.index :user_id
      t.index :label_id
    end
  end
end
