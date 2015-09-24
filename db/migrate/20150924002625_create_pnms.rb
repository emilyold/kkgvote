class CreatePnms < ActiveRecord::Migration
  def change
    create_table :pnms do |t|
      t.string :name
      t.string :ups
      t.string :downs

      t.timestamps null: false
    end
  end
end
