class WydaniesController < ApplicationController

  def new
    @wydanie = Wydanie.new
  end

  def create
    @wydanie = Wydanie.new(wydanie_params)
    @wydanie.user_id = current_user.id
    if @wydanie.save
        #  redirect_to :action => :index
        flash[:success] = "Zamówienie przyjęte do realizacji."
        redirect_to root_path
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  def show
    @wydanie = Wydanie.find(params[:id])
  end
  
  def index
    @wydanies = Wydanie.all.order('created_at DESC')
  end
  
  def edit
    @wydanie = Wydanie.find(params[:id])
  end
  
  def update
     @wydanie = Wydanie.find(params[:id])
     @wydanie.accept_user = current_user.name + " " + current_user.surname
     @wydanie.accept = 1
     a = Explo.find(@wydanie.explo_id).quantity
     b = @wydanie.quantity
     Explo.find(@wydanie.explo_id).update_column(:quantity, a -b)
     if @wydanie.update_attributes(wydanie_params)
       # Handle a successful update.
       flash[:success] = "Wydanie przyjęte"
       redirect_to wydanies_path
     else
       render 'edit'
     end
   end


  private

    def wydanie_params
      params.require(:wydanie).permit(:user_id, :explo_id, :desctiption, :quantity, :accept, :accept_user)
    end

end
