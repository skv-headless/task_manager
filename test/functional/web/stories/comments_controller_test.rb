require 'test_helper'

class Web::Stories::CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = create('story/comment')
    @story = @comment.story
    @request.env['HTTP_REFERER'] = story_path @story
  end

  test 'destroy' do
    delete :destroy, id: @comment, :story_id => @story

    assert !Story::Comment.exists?(:id => @comment)
  end
end
