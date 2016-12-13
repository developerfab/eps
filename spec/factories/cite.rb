FactoryGirl.define do
  factory :cite do
    association :patient, factory: :patient
    association :doctor, factory: :doctor
    association :service, factory: :service
    date_cite "2020-12-12 10:00".to_datetime
    end_cite "2020-12-12 09:50".to_datetime
    authorized true
    valuation "evaluacion"
    available true
  end
end
