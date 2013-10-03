require 'test_helper'

class Api::StoriesControllerTest < ActionController::TestCase
  setup do
    @story = create(:story)
    @user = @story.assigned_to
    sign_in(@user)
  end

  test 'get all stories' do
    get :index, {:format => :json}
    assert_response :success
  end

  test 'should show' do
    get :show, {id: @story, :format => :json}
    assert_response :success
  end
end
