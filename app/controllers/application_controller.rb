class ApplicationController < ActionController::Base
  include Concerns::AuthManagement
  helper_method :current_user, :signed_in?
end
