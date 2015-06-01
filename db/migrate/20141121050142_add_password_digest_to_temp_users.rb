class AddPasswordDigestToTempUsers < ActiveRecord::Migration
  def change
    add_column :temp_users, :password_digest, :string
  end
end
