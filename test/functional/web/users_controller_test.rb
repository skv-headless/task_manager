require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create' do
    assert_difference('User.count') do
      post :create, {
          user: {
            email: 'test@test.ru',
            password: 'test',
            password_confirmation: 'test'
          }
        }
    end
    assert_redirected_to new_session_path
  end

  test 'should not create' do
    assert_no_difference('User.count') do
      post :create, {
          user: {
              email: 'test@test.ru',
              password: 'test',
              password_confirmation: 'test2'
          }
      }
    end
    assert_response :success
  end

end
