class ChangeUserIdToInteger < ActiveRecord::Migration
  def self.up
    change_column :comments, :user_id, :integer
  end
  def self.down
    change_column :comments, :user_id, :string
  end
end
