class CreateNdbs < ActiveRecord::Migration
  def change
    create_table :ndbs do |t|
      t.float :lat
      t.float :lon
      t.integer :elevation
      t.integer :frq
      t.integer :range
      t.string :identifier
      t.string :name

      t.timestamps
    end
  end
end
