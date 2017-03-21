ActiveAdmin.register Subcategory do

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
  permit_params :name, :description, :subsubcategory_id, :category_id
#active_admin_importable
  controller do

    def create
      @subcategory = Subcategory.new (permitted_params[:subcategory])
      create!(:notice => "Dude! Nice job creating that subcategory.") { admin_subcategories_path }
    end
  end
  

end
