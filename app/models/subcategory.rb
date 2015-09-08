class Subcategory < ActiveRecord::Base
     has_many :subsubcategories
     belongs_to :category
     has_many :explos
end
