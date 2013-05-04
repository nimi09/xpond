class AddIndexToFixes < ActiveRecord::Migration
  def change
    add_column :fixes, :user_id, :integer
  end
end
