class SubsubcategoriesController < ApplicationController

  def show
    @subsubcategory = Subsubcategory.find(params["id"])
    @explos = Explo.order("created_at DESC").where(["subsubcategory_id= ?", @subsubcategory.id]) 
  end
  
  def create
    @subsubcategory = Subsubcategory.new(subsubcategory_params)
    if @subsubcategory.save
        #@explo.subsubcategory.subcategory
        flash[:success] = "Podpodkategoria dodana!"
        redirect_to subcategory_path(@subsubcategory.subcategory_id)
        #  redirect_to :action => :index
        #flash[:success] = "Materiał eksploatacyjny dodany!"
        #render 'new'
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  private

    def subsubcategory_params
      params.require(:subsubcategory).permit(:name, :desctiption, :subcategory_id)
    end

end
