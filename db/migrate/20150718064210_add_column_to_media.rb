class AddColumnToMedia < ActiveRecord::Migration
  def change
    add_column :media, :title, :string
  end
end
