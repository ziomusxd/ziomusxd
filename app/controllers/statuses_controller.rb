class StatusesController < ApplicationController

  def index
    @statuses = Status.all
  end
  
  def new
    @status = Status.new
  end
  
  def edit
    @status = Status.find(params[:id])
  end
  
  def update
    @status = Status.find(params[:id])
    if @status.update_attributes(status_params)
      # Handle a successful update.
      flash[:success] = "Status zaktualizowany!"
      redirect_to statuses_path
    else
      render 'edit'
    end
  end
  
  def create
    @status = Status.new(status_params)
      if @status.save
          flash[:success] = "Status dodany!"
          redirect_to statuses_path
      else
        render 'new'
      end
    end
    
  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    flash[:success] = "Status usunięty!"
    redirect_to (:back)
  end

  private
    def status_params
      params.require(:status).permit(:name, :description)
    end

end
