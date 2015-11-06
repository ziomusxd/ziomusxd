class CategoriesController < ApplicationController
    before_filter :check_logged_in
  def index
    @categories = Category.all
    @subcategories = Subcategory.all
    @subsubcategories = Subsubcategory.all 
    @explos = Explo.all
    # @category_id = Category.find_by(name: params[:category])
  #   @gigs = Gig.where(category_id: @category_id).order("created_at DESC")
  #   @subcategory_id = Subcategory.find_by(name: params[:subcategory])
  #   @gigs = Gig.where(subcategory_id: @subcategory_id).order("created_at DESC")
    
  end
  
  def show
    @category = Category.find(params["id"])
  end
  
  def new
    @category = Category.new
  end
  
  
  def create
    @category = Category.new(category_params)
    if @category.save
        #@explo.subsubcategory.subcategory
        flash[:success] = "Kategoria dodana!"
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
  def check_logged_in 
    authenticate_or_request_with_http_basic("Home") do |username, password|
    username == "admin" && password == "admin"
    end
  end
  
  def category_params
    params.require(:category).permit(:name, :desctiption)
  end
    



end
