class ExplosController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  #<% if current_user.admin? %>
  
  
  
  def index
    if current_user.admin?
    #@explos = Explo.all
    #@explos = Explo.search(params[:search])
      @explos = Explo.all.order('created_at DESC')
       if params[:search]
         @explos = Explo.search(params[:search]).order("created_at DESC")
       else
         @explos = Explo.all.order('created_at DESC')
       end
     else
      redirect_to root_path
    end
  end

  def show
    @explo = Explo.find(params["id"])
    @wydanies = @explo.wydanie.paginate(:page => params[:page], :per_page => 30).order('created_at DESC')
    @adoptions = @explo.adoption.order('created_at DESC')
  end
end