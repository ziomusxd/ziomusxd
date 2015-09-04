class CreateAdoptions < ActiveRecord::Migration
  def change
    create_table :adoptions do |t|
      t.integer  :admin_user_id
      t.integer  :explo_id
      t.string   :quantity
      t.string   :description
      t.string   :name
      t.string   :sn
      t.string   :regal
      t.string   :polka
      t.string   :unit_id
      
      t.timestamps null: false
    end
  end
end
