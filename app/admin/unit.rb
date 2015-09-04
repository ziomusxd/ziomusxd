ActiveAdmin.register Unit do

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
permit_params :name, :unit

controller do

  def create
    @unit = Unit.new (permitted_params[:unit])
    create!(:notice => "Jednostka miary dodana!") { admin_units_path }
  end
end

end
