class Web::Story::CommentsController < Web::ApplicationController
  def create
    params[:story_comment].merge!({
        :author => current_user,
        :story_id => params[:story_id]
    })
    @comment = Story::Comment.new(params[:story_comment])

    if @comment.save
      redirect_to :back
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
