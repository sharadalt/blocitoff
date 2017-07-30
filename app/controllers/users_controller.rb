class UsersController < ApplicationController
  before_action :require_sign_in,  except: [:new, :create, :confirm]
  before_action :authorize_user,  except: [:new, :create, :confirm]
  
    def new
     if current_user
       flash[:notice] = "You are already logged_in"
       redirect_to user_todos_path(current_user)
     end
     @user = User.new
    end
    
    def index
      @users = User.paginate(page: params[:page])
    end
    
    def show
      @user = User.find(params[:id])
      @todos = @user.todos.paginate(page: params[:page])
      redirect_to user_todos_path(@user)
    end
    
    def confirm
      @user = User.new
      @user.name = params[:user][:name]
      @user.email = params[:user][:email]
      @user.password = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      
    end
    
    def create
     if current_user
       flash[:notice] = "You are already logged_in"
       redirect_to users_todos_path(current_user)
     end
     @user = User.new
     @user.name = params[:user][:name]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
     @user.password_confirmation = params[:user][:password_confirmation]
     
     if @user.save
       flash[:notice] = "Welcome to Todo_list #{@user.name}!"
       create_session(@user)
       # Deliver the signup email
       UserNotifier.send_signup_email(@user).deliver_now
       redirect_to user_todos_path(@user)
     else
       flash.now[:alert] = "There was an error creating your account. Please try again."
       render :new
     end
    end
    
    def authorize_user
     unless current_user.admin?
       flash[:alert] = "You must be an admin to do that."
       redirect_to root_path
     end
   end
end
