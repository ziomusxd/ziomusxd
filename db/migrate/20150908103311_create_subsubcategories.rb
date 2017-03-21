class CreateSubsubcategories < ActiveRecord::Migration
  def change
    create_table :subsubcategories do |t|
      t.string :name
      t.text :desctiption
      t.timestamps null: false
    end
  end
end
