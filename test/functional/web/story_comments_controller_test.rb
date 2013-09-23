require 'test_helper'

class Web::StoryCommentsControllerTest < ActionController::TestCase
  setup do
    @story_comment = story_comments(:one)
  end

  test 'should create story_comment' do
    @request.env['HTTP_REFERER'] = story_path @story_comment.story_id

    assert_difference('StoryComment.count') do
      post :create, story_comment: { text: @story_comment.text }
    end

    assert_redirected_to story_path @story_comment.story_id
  end

  test 'should destroy story_comment' do
    @request.env['HTTP_REFERER'] = story_path @story_comment.story_id

    assert_difference('StoryComment.count', -1) do
      delete :destroy, id: @story_comment
    end

    assert_redirected_to story_path @story_comment.story_id
  end
end
