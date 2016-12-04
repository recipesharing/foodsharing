module ApplicationHelper
  
  def current_user
    if session[:user_id]
      @current_user||= User.find_by_id session[:user_id]
    end 
  end
 
  def authenticate_user!
    redirect_to root_path unless current_user
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
