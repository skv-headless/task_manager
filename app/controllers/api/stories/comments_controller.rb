class Api::Stories::CommentsController < Api::Stories::ApplicationController
  def show
    @comment = Story::Comment.find(params[:id])
  end

  def create
    @comment = Story::Comment.new(params[:story_comment]) do |comment|
      comment.author = current_user
      comment.story = resource_story
    end

    @comment.save

    respond_with(@comment, :location => nil)
  end
end
