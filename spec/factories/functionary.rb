FactoryGirl.define do
  factory :functionary do
    sequence(:email) { |n| "functionary#{n}@gmail.com" }
    password "12345678"
    password_confirmation "12345678"
    sequence(:document) { |n| "#{n}" }
  end
end
