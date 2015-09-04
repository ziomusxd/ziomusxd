class Category < ActiveRecord::Base
   has_many :items
   has_attached_file :avatar, :styles => { :medium =>     "300x300#", :thumb => "200x200#" }
   validates_attachment :avatar, content_type: { content_type:     ["image/jpg", "image/jpeg", "image/png"] }
   validates :name, presence: true
   

end
