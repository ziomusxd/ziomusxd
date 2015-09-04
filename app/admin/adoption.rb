ActiveAdmin.register Adoption do

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
permit_params :explo_id, :quantity, :description, :name, :sn, :regal, :polka, :unit_id
      
#active_admin_importable
  controller do

    def create
      @adoption = Adoption.new (permitted_params[:adoption])
      if Explo.find_by_id(@adoption.explo_id)
        a = Explo.find_by_id(@adoption.explo_id).quantity
        b = @adoption.quantity
        Explo.find_by_id(@adoption.explo_id).update_column(:quantity, a +b)
        create!(:notice => "Towar dodany!") { new_admin_adoption_path }  
      else
        if Explo.find_by_sn(@adoption.sn)
          a = Explo.find_by_sn(@adoption.sn).quantity
          b = @adoption.quantity
          @adoption.explo_id = Explo.find_by_sn(@adoption.sn).id
          Explo.find_by_sn(@adoption.sn).update_column(:quantity, a +b)
          create!(:notice => "Towar dodany!") { new_admin_adoption_path }  
        else
          @explo = Explo.create (permitted_params[:adoption])
          @adoption.explo_id = Explo.last.id
          create!(:notice => "Utworzony nowy towar i dodany!") { new_admin_adoption_path } 
        
        #redirect_to new_admin_explo_path
      end
    end
  end
end
end
