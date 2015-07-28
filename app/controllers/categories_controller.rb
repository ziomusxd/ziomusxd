class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params["id"])
    #@items = @category.
    @items = @category.items.paginate(:page => params[:page], :per_page => 30)
  end
  

end
