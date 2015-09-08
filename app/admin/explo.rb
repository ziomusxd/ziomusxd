ActiveAdmin.register Explo do

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

permit_params :name, :sn, :regal, :polka, :quantity, :description, :unit_id, :adoption_id, :category_id, :subcategory_id, :subsubcategory_id

controller do

  def create
    @explo = Explo.new (permitted_params[:explo])
    @explo.save
    create!(:notice => "Materał eksploatacyjny dodany!") { admin_explos_path }
  end
end

end
