class StoryObserver < ActiveRecord::Observer
  def after_commit(story)
    StoryMailer.assignment_email(story).deliver if need_assignment_email?(story)
  end

  private

  def need_assignment_email?(story)
    (story.previous_changes.has_key?(:assigned_to_id)) && (!story.assigned_to_id.nil?)
  end
end
