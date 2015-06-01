class CreateUsersInfos < ActiveRecord::Migration
  def change
    create_table :users_infos do |t|
      t.string :introduction
      t.integer :user_id
      t.string :photo

      t.timestamps
    end
  end
end
