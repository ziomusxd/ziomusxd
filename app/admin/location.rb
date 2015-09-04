ActiveAdmin.register Location do

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
permit_params :name, :hall, :city, :address, :description

controller do

  def create
    @location = Location.new (permitted_params[:location])
    create!(:notice => "Lokalizacja dodana!") { admin_locations_path }
  end
end

end
