class AddPassKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pass_key, :string
  end
end
