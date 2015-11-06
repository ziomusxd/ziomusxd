class ItemsController < ApplicationController
    before_filter :check_logged_in
  
  def index
   # @items = Item.all
    @items = Item.paginate(:page => params[:page], :per_page => 30)
    #@categories = Category.all
     if params[:search]
       @items = Item.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
     else
       @items = Item.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
     end
  end
  
  def show
    @item = Item.find(params["id"])
    @wzs = @item.wzs.order('created_at DESC')
    @wz = Wz.new
  end

  def new
    @item = Item.new
  end 
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "Przedmiot dodany!"
      redirect_to items_path
    else
      render 'new'
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      # Handle a successful update.
      flash[:success] = "Zdjęcie dodane"
      redirect_to (@item)
    else
      render 'edit'
    end
  end
  
  

  private
  
    def check_logged_in 
    authenticate_or_request_with_http_basic("Home") do |username, password|
    username == "admin" && password == "admin"
    end
    
    def item_params
      params.require(:item).permit(:name, :sn, :quantity, :description, :unit_id, :location_id, :avatar)
    end
  end

end
