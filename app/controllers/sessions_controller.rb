class SessionsController < ApplicationController
  
  def new
  end
 
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      create_session user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
       # cookies.permanent[:auth_token] = user.auth_token
      #else
       # cookies[:auth_token] = user.auth_token
      #end
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to user_todos_path(user)
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end
 
  def destroy
    destroy_session(current_user)
    #cookies.delete(:auth_token)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
end
