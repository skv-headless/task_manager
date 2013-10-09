# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, :aliases => [:assigned_to, :author] do
    email
    password { generate :string }

    factory :user_with_password_confirmation do
      password_confirmation { password }
    end
  end
end
