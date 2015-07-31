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



form do |f|
  inputs 'Dane' do 
    input :user_id, label: "Kto", :as => :select, :collection => User.all.map {|u| ["#{u.name}", u.id]}
    input :where, label: "Gdzie"
    input :item_id, label: "SN", :as => :select, :collection => Item.all.map {|u| ["#{u.sn}", u.id]}
    input :quantity, label: "Ilosc sztuk"
    actions
  end
end




permit_params :user_id, :quantity, :item_id, :where
#active_admin_importable
  controller do

    def create
      @wz = Wz.new (permitted_params[:wz])
      create!(:notice => "Dude! Nice job creating that vategory.") { admin_wzs_path }
    end
  end


end
