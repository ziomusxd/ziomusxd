ActiveAdmin.register Wz do

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
  column "ID", :id
  column "Użytkownik", :user
  column "Lokalizacja", :location
  column "Item", :item
  column "Utworzone", :created_at
  actions defaults: true
end


form do |f|
  inputs 'Dane' do 
    input :admin_user_id, label: "Kto", :as => :select, :collection => AdminUser.all.map {|u| ["#{u.name + " " + u.surname}", u.id]}   
    input :user_id, label: "Komu", :as => :select, :collection => User.all.map {|u| ["#{u.name}", u.id]}
    input :item_id, label: "SN", :as => :select, :collection => Item.all.map {|u| ["#{u.sn}", u.id]}
    input :location_id, label: "Lokalizacja", :as => :select, :collection => Location.all.map {|u| ["#{u.name}", u.id]}
    input :status_id, label: "Status", :as => :select, :collection => Status.all.map {|u| ["#{u.name}", u.id]}    
    actions
  end
end


permit_params :user_id, :item_id, :location_id, :admin_user_id, :status_id
#active_admin_importable
  controller do

    def create
      @wz = Wz.new (permitted_params[:wz])
      Item.find_by_id(@wz.item_id).update_column(:location_id, @wz.location_id)
      create!(:notice => "Dude! Nice job creating that vategory.") { admin_wzs_path }
    end
  end



end
