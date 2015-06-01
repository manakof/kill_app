class AddPassKeyToTempUsers < ActiveRecord::Migration
  def change
    add_column :temp_users, :pass_key, :string
  end
end
