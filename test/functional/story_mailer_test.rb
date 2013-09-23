require 'test_helper'

class StoryMailerTest < ActionMailer::TestCase
  tests StoryMailer

  setup do
    @story = create :story
  end

  test "assignment email" do
    email = StoryMailer.assignment_email(@story).deliver
    assert_equal ['skv-headless@yandex.ru'], email.from
    assert_not_empty email.body.to_s
  end
end
