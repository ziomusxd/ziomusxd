class CreateTobuys < ActiveRecord::Migration
  def change
    create_table :tobuys do |t|
      t.string :name
      t.text :desctiption
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
