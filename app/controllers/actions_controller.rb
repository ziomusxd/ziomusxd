class ActionsController < ApplicationController

  def new 
    @action = Action.new
  end
  
  def show
    @action = Action.find(params[:id])
  end
  
  def index
    @actions = Action.all
  end
    
  def create
    @action = Action.new(action_params)
    @action.user_id = current_user.id
    if @action.save
        Accident.find(@action.accident_id).update_column(:status_id, @action.status)
        Accident.find(@action.accident_id).update_column(:repman_id, current_user.name + " " + current_user.surname)
        #  redirect_to :action => :index
        flash[:success] = "Akcja dodana!"
        redirect_to (:back)
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  private

  def action_params
    params.require(:foo).permit(:user_id,:status_id, :description, :accident_id)
  end

end
