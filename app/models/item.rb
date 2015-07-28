class Item < ActiveRecord::Base
  belongs_to :category
  validates :category, presence: true
  has_attached_file :avatar, :styles => { :medium =>     "300x300#", :thumb => "200x200#" }
  validates_attachment :avatar, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }

  
end
