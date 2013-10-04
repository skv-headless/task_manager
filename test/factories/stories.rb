# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    title
    description
    assigned_to

    ignore do
      story_attachment_count 2
      story_comment_count 2
    end

    after(:create) do |story, evaluator|
      FactoryGirl.create_list('story/attachment', evaluator.story_attachment_count, story: story)
      FactoryGirl.create_list('story/comment', evaluator.story_comment_count, story: story)
    end
  end
end
