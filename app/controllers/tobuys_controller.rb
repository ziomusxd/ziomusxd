class TobuysController < InheritedResources::Base
  def index
     if current_user.admin?
       @tobuys = Tobuy.all.order('created_at DESC')
     else
      #@tobuys = Tobuy.order("created_at DESC").where("user_id LIKE 11")
      @tobuys = Tobuy.order("created_at DESC").where(["user_id= ?", current_user.id])
    end
    
  end
  
  def new
    @tobuy = Tobuy.new
  end
  
  def create
    @tobuy = Tobuy.new(tobuy_params)
    @tobuy.user_id = current_user.id
    if @tobuy.save
        # #  redirect_to :action => :index
        # flash[:success] = "Welcome to the Sample App!"
        redirect_to @tobuy
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  private

    def tobuy_params
      params.require(:tobuy).permit(:name, :desctiption, :quantity, :user_id)
    end
end

