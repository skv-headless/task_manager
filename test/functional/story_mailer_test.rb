require 'test_helper'

class StoryMailerTest < ActionMailer::TestCase
  tests StoryMailer

  setup do
    @story = create :story
  end

  test "assignment email" do
    email = StoryMailer.assignment_email(@story).deliver
    assert { email.body.to_s.present? }
  end
end
