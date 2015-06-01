class AddPhotoToUsersInfo < ActiveRecord::Migration
  def change
    add_column :users_infos,:photo,:string
  end
end
