class ApplicationController < ActionController::Base
  protect_from_forgery
  include Concerns::AuthManagement
  helper_method :current_user, :signed_in?
end
