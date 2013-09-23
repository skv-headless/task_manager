require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create' do
    attrs = attributes_for(:user)
    assert_difference('User.count') do
      post :create, :user => attrs
    end
    assert_redirected_to new_session_path
  end

  test 'should not create' do
    attrs = attributes_for(:user)
    attrs[:password_confirmation] += 'wrong confirmation'

    assert_no_difference('User.count') do
      post :create, :user => attrs
    end
    assert_response :success
  end
end
