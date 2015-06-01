class AddRememberTokenToTempUser < ActiveRecord::Migration
  def change
    add_column :temp_users,:remember_token,:string
    add_index :temp_users,:remember_token
  end
end
