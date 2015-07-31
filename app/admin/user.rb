ActiveAdmin.register User do

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

permit_params :name, :surname, :proffesion, :email
#active_admin_importable
  controller do

    def create
      @user = User.new (permitted_params[:user])
      create!(:notice => "Dude! Nice job creating that user.") { admin_users_path }
    end
  end

end
