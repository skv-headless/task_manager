class Web::Stories::CommentsController < Web::Stories::ApplicationController
  def destroy
    @comment = Story::Comment.find(params[:id])
    @comment.destroy

    redirect_to :back
  end
end
