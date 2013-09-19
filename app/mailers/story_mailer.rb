class StoryMailer < ActionMailer::Base
  default from: "skv-headless@yandex.ru"

  def assignment_email(story)
    #сделано просто для примера
    #TODO добавить подписчиков к Story
    @user = story.assigned_to
    @story = story
    mail(to: @user.email, subject: "Stroy notification")
  end
end
