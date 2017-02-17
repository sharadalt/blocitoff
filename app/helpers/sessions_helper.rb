module SessionsHelper
  
   def create_session(user)
     session[:user_id] = user.id
   end
 
   def destroy_session(user)
     session[:user_id] = nil
   end
 
   def current_user
     User.find_by(id: session[:user_id])
   end
   
    # Logs in the given user.
   def log_in(user)
     session[:user_id] = user.id
   end
   
   # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

     # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
   
end
