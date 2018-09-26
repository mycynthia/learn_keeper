class RenameOmniauthGoogleUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :goolge_uid, :google_uid
  end
end
