FactoryGirl.define do
  factory :admin do
    sequence(:email) { |n| "admin#{n}@gmail.com" }
    password "12345678"
    password_confirmation "12345678"
    document { rand(100..1000) }
  end
end
