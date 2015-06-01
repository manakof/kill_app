class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :content
      t.string :media_id
      t.integer :user_id

      t.timestamps
    end
  end
end
