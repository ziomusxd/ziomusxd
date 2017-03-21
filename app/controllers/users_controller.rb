class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update] 
  def index
    @users = User.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @user = User.find(params[:id])
    @accidents = @user.accident.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
    @wydanies = @user.wydanie.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)

  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      
        log_in @user
        #  redirect_to :action => :index
        flash[:success] = "Witaj!!"
        redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     if @user.update_attributes(user_params)
       # Handle a successful update.
       flash[:success] = "Profile updated"
       redirect_to @user
     else
       render 'edit'
     end
   end
   
   
    private

      def user_params
        params.require(:user).permit(:name, :surname, :email,:avatar, :password, :admin, :office, :proffesion,
                                     :password_confirmation)
      end
      
      # Confirms a logged-in user.
      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
      end
      
      # Confirms the correct user.
      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user) or current_user.admin?
      end
end
