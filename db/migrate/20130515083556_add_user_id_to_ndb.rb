class AddUserIdToNdb < ActiveRecord::Migration
  def change
    add_column :ndbs, :user_id, :integer
  end
end
