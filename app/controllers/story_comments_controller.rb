class StoryCommentsController < ApplicationController
  # POST /story_comments
  # POST /story_comments.json
  def create
    params[:story_comment][:author] = current_user
    @story_comment = StoryComment.new(params[:story_comment])

    respond_to do |format|
      if @story_comment.save
        format.html { redirect_to request.referrer, notice: 'Story comment was successfully created.' }
        format.json { render json: @story_comment, status: :created, location: @story_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @story_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /story_comments/1
  # PUT /story_comments/1.json
  def update
    @story_comment = StoryComment.find(params[:id])

    respond_to do |format|
      if @story_comment.update_attributes(params[:story_comment])
        format.html { redirect_to @story_comment, notice: 'Story comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_comments/1
  # DELETE /story_comments/1.json
  def destroy
    @story_comment = StoryComment.find(params[:id])
    @story_comment.destroy

    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
    end
  end
end
