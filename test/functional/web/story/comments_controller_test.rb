require 'test_helper'

class Web::Story::CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = create('story/comment')
    @story = @comment.story
    @request.env['HTTP_REFERER'] = story_path @story
  end

  test 'create story/comment' do
    attr = attributes_for('story/comment')
    post :create, { story_comment: attr, :story_id => @story }
    assert Story::Comment.exists?({:text => attr[:text]})
  end

  test 'destroy story/comment' do
    delete :destroy, { id: @comment, :story_id => @story }

    assert !Story::Comment.exists?({:id => @comment.id})
  end
end
