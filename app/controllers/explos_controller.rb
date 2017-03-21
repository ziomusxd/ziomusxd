class ExplosController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  #<% if current_user.admin? %>
  
  def index
    @explos = Explo.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    # if current_user.admin?
 #    #@explos = Explo.all
 #    #@explos = Explo.search(params[:search])
 #      @explos = Explo.all.order('created_at DESC')
 #       if params[:search]
 #         @explos = Explo.search(params[:search]).order("created_at DESC")
 #       else
 #         @explos = Explo.all.order('created_at DESC')
 #       end
 #     else
 #      redirect_to root_path
 # end
  end
  
  def new
    @explo = Explo.new
  end
  
  def create
    @explo = Explo.new(explo_params)
    @explo.quantity = 0
    if @explo.save
      if @explo.subcategory == nil
      @explo.subcategory_id = @explo.subsubcategory.subcategory_id
      else
      end
      flash[:success] = "Materiał eksploatacyjny dodany!"
      redirect_to new_explo_path
    else
      render 'new'
    end
  end
  
  
  def show
    @explo = Explo.find(params["id"])
    @wydanies = @explo.wydanie.paginate(:page => params[:page], :per_page => 30).order('created_at DESC')
    @adoptions = @explo.adoption.order('created_at DESC')
    @wydanie = Wydanie.new
    @explos = Explo.where(["subcategory_id= ?", @explo.subcategory_id]) 
    @tobuy = Tobuy.new
    @adoption = Adoption.new
  end
  
  def edit
    @explo = Explo.find(params[:id])
  end
  
  def update
    @explo = Explo.find(params[:id])
    if @explo.update_attributes(explo_params)
      # Handle a successful update.
      flash[:success] = "Zdjęcie dodane"
      redirect_to (@explo)
    else
      render 'edit'
    end
  end
  
  private

  def sort_column
      Explo.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    def explo_params
      params.require(:explo).permit(:name, :sn, :regal, :polka, :quantity, :description, :unit_id, :category_id, :subcategory_id, :subsubcategory_id, :avatar)
    end
end