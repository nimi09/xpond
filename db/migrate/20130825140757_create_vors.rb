class CreateVors < ActiveRecord::Migration
  def change
    create_table :vors do |t|
      t.float :lat
      t.float :lon
      t.integer :elevation
      t.integer :frq
      t.integer :range
      t.float :slaved
      t.string :identifier
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
