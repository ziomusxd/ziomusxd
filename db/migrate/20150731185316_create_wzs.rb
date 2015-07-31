class CreateWzs < ActiveRecord::Migration
  def change
    create_table :wzs do |t|
      t.string :user_id
      t.string :where
      t.string :item_id
      t.integer :quantity
      
      t.timestamps null: false
    end
  end
end
