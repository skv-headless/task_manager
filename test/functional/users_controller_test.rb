require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get create' do
    assert_difference('User.count') do
      post :create, {
          user: {
            email: 'test@test.ru',
            password: 'test',
            password_confirmation: 'test'
          }
        }
    end
    assert_redirected_to root_path
  end

end
