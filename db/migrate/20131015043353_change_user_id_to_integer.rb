class ChangeUserIdToInteger < ActiveRecord::Migration
  def change
    remove_column :comments, :user_id
    add_column :comments, :user_id, :integer
  end
end
