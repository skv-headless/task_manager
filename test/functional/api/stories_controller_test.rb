require 'test_helper'

class Api::StoriesControllerTest < ActionController::TestCase
  setup do
    @story = create(:story)
    @user = @story.assigned_to
    sign_in(@user)
  end

  test 'index' do
    get :index, :format => :json
    assert_response :success
  end

  test 'show' do
    get :show, :id => @story, :format => :json
    assert_response :success
  end
end
