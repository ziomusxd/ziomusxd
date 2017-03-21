class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :user_id
      t.string :description
      t.integer :accident_id
      
      t.timestamps null: false
    end
  end
end
