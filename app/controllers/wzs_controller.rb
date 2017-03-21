class WzsController < ApplicationController
  before_filter :check_logged_in
  
  
  def index 
    @wzs = Wz.all.order('created_at DESC')
  end
  
  def new
    @wz = Wz.new
  end
  
  def create
    @wz = Wz.new(wz_params)
    if @wz.save
      Item.find(@wz.item_id).update_column(:location_id, @wz.location_id)
      flash[:success] = "Zmiana dodana!"
      redirect_to (:back)
    else
      redirect_to (:back)
      flash[:success] = "Brakuje jakiegoś parametru!"
    end
  end
  
  def show
    @wz = Wz.find(params[:id])
    
  end

  private
  def check_logged_in 
    authenticate_or_request_with_http_basic("Home") do |username, password|
    username == "admin" && password == "admin"
  end
  
  def wz_params
    params.require(:wz).permit(:user_id, :item_id, :location_id, :status_id, :description, :admin_user_id)
  end
end
end
