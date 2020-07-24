class ApplicationController < ActionController::Base 
  helper_method :current_user
  helper_method :logged_in?

  def home
    @user = User.find_or_create_by(params[:id])
  end
    
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end
  
  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end

end
