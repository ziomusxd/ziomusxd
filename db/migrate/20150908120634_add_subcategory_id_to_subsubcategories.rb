class AddSubcategoryIdToSubsubcategories < ActiveRecord::Migration
  def change
    add_column :subsubcategories, :subcategory_id, :integer
  end
end
