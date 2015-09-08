class SubcategoriesController < ApplicationController
  
  def show
    @subcategory = Subcategory.find(params["id"])
    @explos= Explo.order("created_at DESC").where(["subcategory_id= ?", @subcategory.id]) 
    @wydanie = Explo.new
  end
  
  private

    def subcategory_params
      params.require(:subcategory).permit(:name, :desctiption, :category_id)
    end

end
