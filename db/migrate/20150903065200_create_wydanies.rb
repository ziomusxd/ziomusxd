class CreateWydanies < ActiveRecord::Migration
  def change
    create_table :wydanies do |t|
      
      t.integer :explo_id
      t.integer :quantity
      t.integer :user_id
      t.text    :description
      
      
      t.timestamps null: false
    end
  end
end
