FactoryGirl.define do
  factory :patient do
    sequence(:email) { |n| "patient#{n}@gmail.com" }
    password "12345678"
    password_confirmation "12345678"
    document { rand(100..1000) }
    name "Carlos"
    last_name "Moreno"
    birthdate "1992-12-12".to_datetime
    phone "5555555"
    gender "MALE"
    association :additional_information_user, factory: :additional_information_user
  end
end
