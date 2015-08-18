class CategoriesController < ApplicationController
    before_filter :check_logged_in
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params["id"])
    #@items = @category.
    @items = @category.items.paginate(:page => params[:page], :per_page => 30)
  end
  


  private
  def check_logged_in 
    authenticate_or_request_with_http_basic("Home") do |username, password|
    username == "admin" && password == "admin"
  end
end
end
