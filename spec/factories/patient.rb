FactoryGirl.define do
  factory :patient do
    sequence(:email) { |n| "patient#{n}@gmail.com" }
    password "12345678"
    password_confirmation "12345678"
    sequence(:document) { |n| "#{n}" }
    name "Carlos"
    last_name "Moreno"
    birthdate "1992-12-12".to_datetime
    phone "5555555"
    gender "MALE"
  end
end
