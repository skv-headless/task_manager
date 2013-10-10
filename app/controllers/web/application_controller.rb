class Web::ApplicationController < ::ApplicationController
  protect_from_forgery
  include Concerns::FlashHelper
end
