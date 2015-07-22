class ChangeColumnToMedia < ActiveRecord::Migration
  def change
    change_column :media,:content,:text
  end
end
