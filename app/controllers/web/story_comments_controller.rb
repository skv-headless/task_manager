class Web::StoryCommentsController < Web::ApplicationController
  def create
    params[:story_comment][:author] = current_user
    @story_comment = StoryComment.new(params[:story_comment])

    if @story_comment.save
      redirect_to request.referrer, notice: 'Story comment was successfully created.'
    else
      render action: "new"
    end
  end

  def destroy
    @story_comment = StoryComment.find(params[:id])
    @story_comment.destroy

    redirect_to request.referrer
  end
end
