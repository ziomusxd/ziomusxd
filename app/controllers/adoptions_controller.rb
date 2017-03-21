class AdoptionsController < ApplicationController

  def index
    @adoptions = Adoption.all.order('created_at DESC')
  end
  
  def new
    @adoption = Adoption.new
  end
  
  def create
    @adoption = Adoption.new(adoption_params)
    @adoption.user_id = current_user.id
    if @adoption.save
        a = Explo.find(@adoption.explo_id).quantity
        b = @adoption.quantity
        Explo.find(@adoption.explo_id).update_column(:quantity, a +b)
        flash[:success] = "Eksploatacja dodana!"
        redirect_to (:back)    
    else
      render 'new'
    end
  end
  
  def show
    @adoption = Adoption.find(params[:id])
  end
  
  
  private

    def adoption_params
      params.require(:adoption).permit(:user_id, :explo_id, :description, :quantity)
    end
  

end
