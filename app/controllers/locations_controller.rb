class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end
  
  def new
    @location = Location.new
  end
  
  def edit
    @location = Location.find(params[:id])
  end
  
  def update
    @location = Location.find(params[:id])
    @location.name = "#{@location.city}_#{@location.hall}"
    if @location.update_attributes(location_params)
      # Handle a successful update.
      flash[:success] = "Lokalizacja zaktualizowana!"
      redirect_to locations_path
    else
      render 'edit'
    end
  end
  
  def create
    @location = Location.new(location_params)
    @location.name = "#{@location.city}_#{@location.hall}"
      if @location.save
          flash[:success] = "Lokalizacja dodana!"
          redirect_to locations_path
      else
        render 'new'
      end
    end
    
  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:success] = "Lokalizacja usunięta!"
    redirect_to (:back)
  end

  private
    def location_params
      params.require(:location).permit(:city, :hall, :adress)
    end
    
end
