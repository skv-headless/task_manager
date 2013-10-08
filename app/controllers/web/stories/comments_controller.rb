class Web::Stories::CommentsController < Web::Stories::ApplicationController
  def destroy
    @comment = resource_story.comments.find(params[:id])
    @comment.destroy

    redirect_to :back
  end
end
