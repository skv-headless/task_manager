class StoryMailer < ActionMailer::Base
  default from: "skv-headless@yandex.ru"

  def assignment_email(story)
    @user = story.assigned_to
    @story = story
    mail(to: @user.email)
  end
end
