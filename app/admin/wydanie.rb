ActiveAdmin.register Wydanie do
  scope :all, default: true
  config.sort_order = 'id_asc'
  #index download_links: [:pdf]
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

 
permit_params :user_id, :explo_id, :desctiption, :quantity
#active_admin_importable
  controller do

    def create
      @wydanie = Wydanie.new (permitted_params[:wydanie])
      a = Explo.find(@wydanie.explo_id).quantity
      b = @wydanie.quantity
      Explo.find(@wydanie.explo_id).update_column(:quantity, a -b)
      create!(:notice => "Towar wydany!") { admin_wydanies_path }   
    end
    

  end
  
  

end
