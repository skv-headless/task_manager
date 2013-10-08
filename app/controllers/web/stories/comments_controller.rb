class Web::Stories::CommentsController < Web::Stories::ApplicationController
  def new
    @story = resource_story
    @comment = @story.comments.build(:parent_id => params[:parent_id])
  end

  def create
    @comment = resource_story.comments.build(params[:story_comment])
    @comment.author = current_user

    if @comment.save
      redirect_to story_path(params[:story_id])
    else
      render action: "new"
    end
  end

  def destroy
    @comment = Story::Comment.find(params[:id])
    @comment.destroy

    redirect_to :back
  end
end
