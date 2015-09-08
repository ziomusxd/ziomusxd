class CreateAccidents < ActiveRecord::Migration
  def change
    create_table :accidents do |t|
      t.integer  :user_id
      t.integer  :location_id
      t.text     :desctiption
      t.integer  :status_id
      t.string   :mode
      t.timestamps null: false
    end
  end
end
