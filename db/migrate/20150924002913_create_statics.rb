class CreateStatics < ActiveRecord::Migration
  def change
    create_table :statics do |t|
      t.integer :prev
      t.integer :current
      t.integer :next

      t.timestamps null: false
    end
  end
end
