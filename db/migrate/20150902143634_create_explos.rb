class CreateExplos < ActiveRecord::Migration
  def change
    create_table :explos do |t|
      
      t.string :name
      t.string :sn
      t.string :regal
      t.string :polka
      t.string :quantity
      t.string :description
      t.string :unit_id
      
      
      t.timestamps null: false
    end
  end
end
