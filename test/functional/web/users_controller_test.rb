require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test 'new' do
    get :new
    assert_response :success
  end

  test 'create' do
    attrs = attributes_for(:user)
    post :create, :user => attrs
    assert_response :redirect

    user = User.where(:email => attrs[:email]).first
    assert { user }
  end
end
