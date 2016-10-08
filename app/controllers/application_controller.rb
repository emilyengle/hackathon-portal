class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize_user
    flash[:error] = "You must login to view this page." unless current_user
    redirect_to login_path unless current_user
  end

  def authorize_admin
    flash[:error] = "You must be an admin to view this page." unless current_user.admin?
    redirect_to login_path unless current_user.admin?
  end

  def not_found
    raise ActionController::RoutingError.new "Not Found"
  end
end
