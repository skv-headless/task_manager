class Api::Stories::CommentsController < Api::Stories::ApplicationController
  def show
    @comment = resource_story.comments.find(params[:id])
  end

  def create
    @comment = resource_story.comments.build(params[:story_comment])
    @comment.author = current_user
    @comment.save

    respond_with(@comment, :location => nil)
  end
end
