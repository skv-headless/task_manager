require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create' do
    attrs = attributes_for(:user)
    post :create, :user => attrs
    assert User.exists?({:email => attrs[:email]})
  end
end
