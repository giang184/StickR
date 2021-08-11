class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      flash[:alert] = "You need to sign in to view this page."
      redirect_to '/signin'
    end
  end

  def authorize_admin
    if !(current_user && current_user.admin)
      flash[:alert] = "You need admin privileges to view this page. Please sign in with an admin account"
      redirect_to '/signin'
    end
  end
end
