class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :require_user
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/log_in' unless current_user
  end
end
