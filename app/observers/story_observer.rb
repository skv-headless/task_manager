class StoryObserver < ActiveRecord::Observer
  def after_save(story)
    StoryMailer.assignment_email(story).deliver if need_assignment_email?(story)
  end

  private

  def need_assignment_email?(story)
    (story.assigned_to_id_changed?) && (!story.assigned_to_id.nil?)
  end
end
