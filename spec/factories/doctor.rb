FactoryGirl.define do
  factory :doctor do
    speciality "GENERAL"
    medical_license "123321"
    schedule "7 AM - 4 PM"
    worked_days [ "LUNES", "MIERCOLES", "VIERNES"]
    association :user, factory: :user
  end
end
