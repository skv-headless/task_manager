class Api::Stories::ApplicationController < Api::ApplicationController
  helper_method :resource_story

  private

  def resource_story
    @story ||= Story.find(params[:story_id])
  end
end
