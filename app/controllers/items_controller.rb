class ItemsController < ApplicationController
    before_filter :check_logged_in
  def index
   # @items = Item.all
    @items = Item.paginate(:page => params[:page], :per_page => 30)
  end
  
  def show
    @item = Item.find(params["id"])
  end


  private
  def check_logged_in 
    authenticate_or_request_with_http_basic("Home") do |username, password|
    username == "admin" && password == "admin"
  end
end
end
