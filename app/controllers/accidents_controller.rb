class AccidentsController < ApplicationController

  def new
    @accident = Accident.new
    @locations = Location.all
  end

  def create
    @accident = Accident.new(accident_params)
    @accident.user_id = current_user.id
    @accident.status_id = 1
    @accident.repman_id = "Oczekuje"
    if @accident.save
        #  redirect_to :action => :index
        flash[:success] = "Awaria zgłoszona"
        redirect_to @accident
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  def show
    @accident = Accident.find(params[:id])
    @action = Action.new
    @actions = Action.all
  end
  
  def ac
    @accidents = Accident.all
  end
  
  def index
    @accidents = Accident.all.order('created_at DESC')
  end
  
  def edit
    @accident = Accident.find(params[:id])
  end
  
  def update
     @accident = Accident.find(params[:id])
     @accident.repman_id = current_user.name + " " + current_user.surname
     if @accident.update_attributes(accident_params)
       # Handle a successful update.
       flash[:success] = "Awazja zaktualizowana."
       redirect_to accidents_path
     else
       render 'edit'
     end
   end
  
  private

    def accident_params
      params.require(:accident).permit(:user_id, :location_id, :desctiption, :status_id, :mode)
    end
  
  

end
