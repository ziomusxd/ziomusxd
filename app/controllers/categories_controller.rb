class CategoriesController < ApplicationController
    before_filter :check_logged_in
  def index
    @categories = Category.all
    @subcategories = Subcategory.all
    @subsubcategories = Subsubcategory.all 
    # @category_id = Category.find_by(name: params[:category])
  #   @gigs = Gig.where(category_id: @category_id).order("created_at DESC")
  #   @subcategory_id = Subcategory.find_by(name: params[:subcategory])
  #   @gigs = Gig.where(subcategory_id: @subcategory_id).order("created_at DESC")
    
  end
  
  def show
    @category = Category.find(params["id"])
  end
  


  private
  def check_logged_in 
    authenticate_or_request_with_http_basic("Home") do |username, password|
    username == "admin" && password == "admin"
    end
  end
  private

    def category_params
      params.require(:category).permit(:name, :desctiption)
    end
    



end
