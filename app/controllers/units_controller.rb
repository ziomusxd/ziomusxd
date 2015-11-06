class UnitsController < ApplicationController

    def index
      @units = Unit.all
    end
  
    def new
      @unit = Unit.new
    end
  
    def edit
      @unit = Unit.find(params[:id])
    end
  
    def update
      @unit = Unit.find(params[:id])
      if @unit.update_attributes(unit_params)
        # Handle a successful update.
        flash[:success] = "Jednostka zaktualizowana!"
        redirect_to units_path
      else
        render 'edit'
      end
    end
  
    def create
      @unit = Unit.new(unit_params)
        if @unit.save
            flash[:success] = "Jednostka dodana!"
            redirect_to units_path
        else
          render 'new'
        end
      end

    private
      def unit_params
        params.require(:unit).permit(:name, :unit)
      end

end
