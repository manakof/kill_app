class AddIndexToTempUsersEmail < ActiveRecord::Migration
  def change
    add_index :temp_users,:email ,unique:true
  end
end
