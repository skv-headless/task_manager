class ApplicationController < ActionController::Base
  protect_from_forgery

  #TODO FIXME сделать Concerns
  def sign_in(user)
    session[:user_id] = user.id
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session[:user_id] = nil
  end

  def authenticate_user!
    redirect_to new_session_path unless session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user, :signed_in?
end
