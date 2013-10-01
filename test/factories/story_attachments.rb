# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'story/attachment' do
    path "MyString"
    story nil
  end
end
