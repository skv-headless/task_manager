require 'test_helper'

class Api::Story::CommentsControllerTest < ActionController::TestCase
  setup do
    @story = create :story
  end

  test 'create' do
    attrs = attributes_for('story/comment')
    post :create, { story_comment: attrs, :story_id => @story }
    assert Story::Comment.exists?({:text => attrs[:text]})
    assert_response :created
  end
end
