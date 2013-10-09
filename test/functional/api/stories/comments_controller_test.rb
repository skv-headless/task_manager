require 'test_helper'

class Api::Stories::CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = create('story/comment')
    @story = @comment.story
  end

  test 'create' do
    attrs = attributes_for('story/comment')
    post :create, story_comment: attrs, :story_id => @story, :format => :json
    assert_response :created

    comment = Story::Comment.where({:text => attrs[:text]}).first!
    assert { comment }
  end

  test 'show' do
    get :show, :id => @comment, :story_id => @story, :format => :json
    assert_response :success
  end
end
