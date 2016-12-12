FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password "12345678"
    password_confirmation "12345678"
    document { rand(100..1000) }
    name "Carlos"
    last_name "Moreno"
    phone "5555555"
    gender "MALE"
    birthdate "1990-12-12".to_datetime
  end
end
