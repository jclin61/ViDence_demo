class AddUserIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_reference :comments, :user, index: true
  end
end
