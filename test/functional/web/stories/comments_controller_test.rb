require 'test_helper'

class Web::Stories::CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = create('story/comment')
    @story = @comment.story
    @request.env['HTTP_REFERER'] = story_path @story
  end

  test 'create' do
    attr = attributes_for('story/comment')
    post :create, story_comment: attr, :story_id => @story
    assert_response :redirect

    comment = Story::Comment.where(:text => attr[:text]).first
    assert comment
  end

  test 'destroy' do
    delete :destroy, id: @comment, :story_id => @story

    assert !Story::Comment.exists?(:id => @comment)
  end
end
