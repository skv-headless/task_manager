require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  setup do
    @story = stories(:one)
    @user = users(:one)
    session[:user_id] = @user.id
  end

  test 'should be redirected' do
    session[:user_id] = nil
    get :index
    assert_redirected_to new_session_path
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test 'should get filtered index' do
    get :index, {:assigned_to_id => @user.id}
    assert_select 'table' do |elements|
      assert_select 'tr', 2 # header + 1 element
    end

    get :index, {:state => 'new'}
    assert_select 'table' do |elements|
      assert_select 'tr', 3 # header + 2 elements
    end
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create story' do
    assert_difference('Story.count') do
      post :create, story: {
          description: @story.description,
          state: @story.state,
          title: @story.title
      }
    end

    assert_redirected_to story_path(assigns(:story))
  end

  test 'should not create' do
    assert_no_difference('Story.count') do
      post :create, story: {}
    end

    assert_response :success
  end

  test 'should show' do
    get :show, id: @story
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @story
    assert_response :success
  end

  test 'should update story' do
    put :update, id: @story, story: {
        description: @story.description,
        state: @story.state,
        title: @story.title
    }
    assert_redirected_to story_path(assigns(:story))
  end

  test 'should send email' do
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      put :update, id: @story, story: {
          assigned_to_id: users(:two).id,
      }
    end
  end

  test 'should not update without title' do
    put :update, id: @story, story: {
        description: ''
    }
    assert_response :success
  end

  test 'should destroy story' do
    assert_difference('Story.count', -1) do
      delete :destroy, id: @story
    end

    assert_redirected_to stories_path
  end
end
