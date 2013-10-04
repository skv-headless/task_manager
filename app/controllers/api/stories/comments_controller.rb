class Api::Stories::CommentsController < Api::ApplicationController
  def show
    @comment = Story::Comment.find(params[:id])
  end

  def create
    params[:story_comment].merge!({
      :author => current_user,
      :story_id => params[:story_id]
    })
    @comment = Story::Comment.new(params[:story_comment])

    if @comment.save
      redirect_to api_story_comment_path(@comment.story_id, @comment)
    else
      render :json => {:errors => @comment.errors.full_messages}, :status => :unprocessable_entity
    end
  end
end
