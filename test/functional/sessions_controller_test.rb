require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should login user' do
    post :create, {
          email: users(:one).email,
          password: users(:one).id,
          password_confirmation: users(:one).id
    }

    assert_equal(users(:one).id, session[:user_id])
    assert_redirected_to root_url
  end

  test 'should get create' do
    get :create
    assert_response :success
  end

  test 'should get destroy' do
    delete :destroy
    assert_redirected_to new_session_path
    assert_nil session[:user_id]
  end

end
