FactoryGirl.define do

  sequence :order do |n|
    n
  end

  sequence :string do |n|
    "string#{n}"
  end

  sequence :description do |n|
    "description#{n}"
  end

  sequence :title do |n|
    "title#{n}"
  end

  sequence :email do |n|
    "email_#{n}@mail.com"
  end
end
