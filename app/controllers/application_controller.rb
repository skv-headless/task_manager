class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def authenticate_user!
    redirect_to new_session_path unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
