class AddSubcategoryIdToExplos < ActiveRecord::Migration
  def change
    add_column :explos, :subcategory_id, :integer
    add_column :explos, :category_id, :integer
    add_column :explos, :subsubcategory_id, :integer
  end
end
