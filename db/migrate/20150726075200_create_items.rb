class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :sn
      t.string :hall
      t.string :proffesion
      t.string :city
      t.integer :quantity
      t.text :description
      t.timestamps null: false
    end
  end
end
