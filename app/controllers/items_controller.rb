class ItemsController < ApplicationController
    before_filter :check_logged_in
  
  def index
   # @items = Item.all
    @items = Item.paginate(:page => params[:page], :per_page => 30)
    @categories = Category.all
     if params[:search]
       @items = Item.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
     else
       @items = Item.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
     end
  end
  
  def show
    @item = Item.find(params["id"])
    @wzs = @item.wzs.order('created_at DESC')
  end

  private
  
    def check_logged_in 
    authenticate_or_request_with_http_basic("Home") do |username, password|
    username == "admin" && password == "admin"
    end
  end

end
