ActiveAdmin.register Status do

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



permit_params :name, :desctiption
#active_admin_importable
  controller do

    def create
      @status = Status.new (permitted_params[:status])
      create!(:notice => "Status utworzony.") { admin_statuses_path }
    end
  end
  
  

end
