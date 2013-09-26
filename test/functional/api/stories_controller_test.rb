require 'test_helper'

class Api::StoriesControllerTest < ActionController::TestCase
  setup do
    @story = create(:story)
    @user = @story.assigned_to
    sign_in(@user)
  end

  test 'get all stories' do
    get :index, {:format => :json}
    body = JSON.parse(@response.body).with_indifferent_access
    first_story = body[:stories][0]

    assert_response :success
    assert_equal @story.id, first_story[:id]
  end

  test 'should show' do
    get :show, {id: @story, :format => :json}
    assert_response :success
  end
end
