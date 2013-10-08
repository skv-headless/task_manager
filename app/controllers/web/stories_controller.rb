class Web::StoriesController < Web::ApplicationController
  before_filter :authenticate_user!
  add_breadcrumb :index, :stories_path

  before_filter only: [:show, :new, :edit] do
    add_breadcrumb action_name.to_sym, request.fullpath
  end

  def index
    query = { s: 'created_at desc' }.merge(params[:q] || {})
    @q = Story.search(query)
    @stories = @q.result(:distinct => true)
                  .includes(:assigned_to)
                  .page(params[:page]).per(5)
  end

  def show
    @story = Story.find(params[:id])
    @comment = @story.comments.build
    @attachments = @story.attachments.decorate
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
