FactoryGirl.define do
  factory :doctor do
    sequence(:email) { |n| "doctor#{n}@gmail.com" }
    password "12345678"
    password_confirmation "12345678"
    sequence(:document) { |n| "#{n}" }
    speciality "GENERAL"
    medical_license "123321"
    schedule "7 AM - 4 PM"
    worked_days [ "LUNES", "MIERCOLES", "VIERNES"]
  end
end
