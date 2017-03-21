class UnitsController < ApplicationController

    # def index
    #   @units = Unit.all
    # end
    #
    # def new
    #   @unit = Unit.new
    # end
    #
    # def edit
    #   @unit = Unit.find(params[:id])
    # end
    #
    # def update
    #   @unit = Unit.find(params[:id])
    #   if @unit.update_attributes(unit_params)
    #     # Handle a successful update.
    #     flash[:success] = "Jednostka zaktualizowana!"
    #     redirect_to units_path
    #   else
    #     render 'edit'
    #   end
    # end
    #
    # def create
    #   @unit = Unit.new(unit_params)
    #     if @unit.save
    #         flash[:success] = "Jednostka dodana!"
    #         redirect_to units_path
    #     else
    #       render 'new'
    #     end
    #   end
    #
    # private
    #   def unit_params
    #     params.require(:unit).permit(:name, :unit)
    #   end

     before_action :all_units, only: [:index, :create, :update]
     before_action :set_units, only: [:edit, :update, :destroy]
     respond_to :html, :js

      # index action has been removed

      def new
        @unit = Unit.new
      end

      def create
        @unit  = Unit.create(unit_params)
        respond_to do |format|
          format.html { redirect_to unit_path }
          format.js { render :layout => false }
        end
      end

      def update
       @unit.update_attributes(unit_params)
      end
       
      def destroy
        @unit.destroy
        respond_to do |format|
          format.html { redirect_to unit_path }
          format.js { render :layout => false }
        end
      end
      
      
      private

        def all_units
          @units = Unit.all
        end

        def unit_params
          params.require(:unit).permit(:name, :unit)
        end
        def set_units
             @unit = Unit.find(params[:id])
           end



end
