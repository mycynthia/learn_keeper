class AddGoogleOmniauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :goolge_uid, :string
    add_column :users, :google_token, :string
  end
end
