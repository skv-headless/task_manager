require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get create' do
    post :create, {
        user: {
          email: 'test@test.ru',
          password: 'test',
          password_confirmation: 'test'
        }
      }
    #assert_response :success
    assert_redirected_to sessions_new_path
  end

end
