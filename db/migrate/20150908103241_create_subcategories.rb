class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.text :desctiption
      t.integer :subsubcategory_id
      t.timestamps null: false
    end
  end
end
