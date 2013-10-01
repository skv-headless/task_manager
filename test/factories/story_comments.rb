# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'story/comment' do
    text { generate :string }
    author
    story
  end
end
