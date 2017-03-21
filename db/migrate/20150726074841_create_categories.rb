class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      ## you can add more stuff as per your requirements 
      t.timestamps null: false
    end
  end
end
