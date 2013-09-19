require 'test_helper'

class StoryMailerTest < ActionMailer::TestCase
  tests StoryMailer
  test "assignment email" do
    email = StoryMailer.assignment_email(stories(:one)).deliver
    assert_equal ['skv-headless@yandex.ru'], email.from
    assert_not_empty email.body.to_s
  end
end
