class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :unit
  belongs_to :location
  has_many :wzs
  validates :unit_id, :location_id, :name, :quantity, :sn, presence: true
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



  def self.search(search)
    where("sn LIKE ?", "%#{search}%")
  end
  
end
