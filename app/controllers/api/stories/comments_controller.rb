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
    @comment.save

    respond_with(@comment, :location => nil)
  end
end
