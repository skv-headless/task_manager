class Api::Story::CommentsController < Api::ApplicationController
  def create
    params[:story_comment].merge!({
      :author => current_user,
      :story_id => params[:story_id]
    })
    @comment = Story::Comment.new(params[:story_comment])

    if @comment.save
      render :json => @comment, :status => :created
    else
      render :json => {:errors => @comment.errors.full_messages}, :status => :unprocessable_entity
    end
  end
end
