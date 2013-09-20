require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  #TODO заменить фикстуры на factory_girl

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should login user' do
    user = users(:one)
    post :create, {
          email: user.email,
          password: "",
          password_confirmation: ""
    }

    assert_equal(user, current_user)
    assert_redirected_to root_url
  end

  test 'should get create' do
    get :create
    assert_response :success
  end

  test 'should get destroy' do
    delete :destroy
    assert_redirected_to new_session_path
    assert !signed_in?
  end
end
