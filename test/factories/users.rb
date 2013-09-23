# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email
    password { generate :string }
    password_confirmation { password }
  end
end
