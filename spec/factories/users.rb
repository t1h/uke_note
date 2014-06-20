# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "example#{n.to_s}@example.com"
  end
  factory :user do
    email
    password 'changeme'
    password_confirmation 'changeme'
  end
end
