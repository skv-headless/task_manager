class Web::StoriesController < Web::ApplicationController
  before_filter :authenticate_user!

  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @q = Story.search(query)
    @stories = @q.result(distinct: true).includes(:assigned_to)
  end

  def show
    @story = Story.find(params[:id])
    @story_comment = StoryComment.new
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(params[:story])

    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(params[:story])
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to stories_url
  end
end
