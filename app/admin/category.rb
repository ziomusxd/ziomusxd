ActiveAdmin.register Category do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
index do
  column "Nazwa", :name
 # column :avatar do |item|
#      image_tag(item.avatar.url(:thumb)) 
 #   end
 column "Uwagi", :description
 column "Ostatnia zmiana", :updated_at
  actions defaults: true
end





show do
  
  attributes_table do
        row :name
        row :avatar do |item|
          image_tag(category.avatar.url(:thumb)) 
        end
        row :description
      end
  
end


form :html => { :enctype => "multipart/form-data" } do |f|
  inputs 'Dane' do 
    input :name, label: "Nazwa"
    input :description, label: "Opis"
    input :avatar, :required => false, :as => :file
    actions
  end
end




  permit_params :name, :description, :avatar, :avatar_file_name,
                  :avatar_content_type,
                  :avatar_file_size,
                  :avatar_updated_at
#active_admin_importable
  controller do

    def create
      @category = Category.new (permitted_params[:category])
      create!(:notice => "Dude! Nice job creating that vategory.") { admin_categories_path }
    end
  end
  

end
