class WydaniesController < ApplicationController

  def new
    @wydanie = Wydanie.new
  end

  def create
    @wydanie = Wydanie.new(wydanie_params)
    @wydanie.user_id = current_user.id
    @wydanie.accept_id = 1
    if @wydanie.save
        #  redirect_to :action => :index
        flash[:success] = "Zamówienie przyjęte do realizacji."
        #redirect_to categories_path
        redirect_to explo_path(@wydanie.explo_id)
    else
      render 'new'
    end
  end
  
  def show
    #@wydanies = Wydanie.where(["sta= ?", @subcategory.id]) 
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
     if @wydanie.update_attributes(wydanie_params)
     if @wydanie.accept_id == 1 
       flash[:success] = "Status zmieniony na oczekujący"
       redirect_to wydanies_path
     end
     if @wydanie.accept_id == 2
       flash[:success] = "Status zmieniony na zaakceptowany"
       redirect_to wydanies_path
     end
     if @wydanie.accept_id == 3
       flash[:success] = "Status zmieniony na odrzucony"
       redirect_to wydanies_path
     end
     if @wydanie.accept_id == 4
       a = Explo.find(@wydanie.explo_id).quantity
       b = @wydanie.quantity
       Explo.find(@wydanie.explo_id).update_column(:quantity, a -b)
       flash[:success] = "Zamówienie przyjęte i wydane"
       redirect_to wydanies_path
     end
     else
       render 'edit'
     end
   end
   
   def accepted
     @wydanies = Wydanie.all.order('created_at DESC')  
   end
   
   def all
     @wydanies = Wydanie.all.order('created_at DESC')     
   end


  private

    def wydanie_params
      params.require(:wydanie).permit(:user_id, :explo_id, :description, :quantity, :accept_id, :accept_user)
    end

end
