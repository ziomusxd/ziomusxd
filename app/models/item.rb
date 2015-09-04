class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :unit
  belongs_to :location
  has_many :wzs
  validates :category_id, :unit_id, :location_id, :name, :quantity, :sn, presence: true
  has_attached_file :avatar, :styles => { :medium =>     "300x300#", :thumb => "200x200#" }
  validates_attachment :avatar, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }




  def self.search(search)
    where("sn LIKE ?", "%#{search}%")
  end
  
end
