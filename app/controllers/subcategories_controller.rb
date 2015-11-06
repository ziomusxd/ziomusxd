class SubcategoriesController < ApplicationController
  
  def show
    @subcategory = Subcategory.find(params["id"])
    @explos= Explo.order("created_at DESC").where(["subcategory_id= ?", @subcategory.id]) 
    @subsubcategory = Subsubcategory.new
    @subsubcategories = Subsubcategory.all
  end
  
  
  def new
    @subcategory = Subcategory.new
  end
  
  
  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
        #@explo.subsubcategory.subcategory
        flash[:success] = "Podkategoria dodana!"
        redirect_to categories_path
        #  redirect_to :action => :index
        #flash[:success] = "Materiał eksploatacyjny dodany!"
        #render 'new'
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  
  private

    def subcategory_params
      params.require(:subcategory).permit(:name, :desctiption, :category_id)
    end

end
