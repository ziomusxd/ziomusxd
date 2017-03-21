ActiveAdmin.register Item do

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
  column "SN", :sn
  column "Ilość", :quantity
 # column :avatar do |item|
#      image_tag(item.avatar.url(:thumb)) 
 #   end
 column "Jednostka", :unit
 column "Lokalizacja", :location
 column "Uwagi", :description
  actions defaults: true
end

form :html => { :enctype => "multipart/form-data" } do |f|
  inputs 'Dane' do 
    input :category_id, label: "Kategoria", :as => :select, :collection => Category.all.map {|u| ["#{u.name}", u.id]}
    input :unit_id, label: "Jednostka", :as => :select, :collection => Unit.all.map {|u| [u.name,u.id]}
    input :location_id, label: "Lokalizacja", :as =>:select, :collection => Location.all.map {|u| [u.name, u.id]}
    input :name, label: "Nazwa"
    input :description, label: "Opis"
    input :quantity, label: "Ilość"
    input :sn, label: "SN"
    input :avatar, :required => false, :as => :file
    actions
  end
end

show do
  
  attributes_table do
        row :name
        row :category
        row :location
        row :sn
        row :avatar do |item|
          image_tag(item.avatar.url(:thumb)) 
        end
        row :description
      end
  
end





permit_params :category_id, :name, :sn, :unit_id, :location_id, :quantity, :description, :avatar,
                  :avatar_file_name,
                  :avatar_content_type,
                  :avatar_file_size,
                  :avatar_updated_at
#active_admin_importable
  controller do

    def create
      @item = Item.new (permitted_params[:item])
      create!(:notice => "Dude! Nice job creating that vategory.") { admin_items_path }
    end
  end

end
