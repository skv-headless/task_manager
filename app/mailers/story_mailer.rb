class StoryMailer < ActionMailer::Base
  default from: configus.admin_email

  def assignment_email(story)
    @user = story.assigned_to
    @story = story
    mail(to: @user.email)
  end
end
