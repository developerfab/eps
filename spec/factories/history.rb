FactoryGirl.define do
  factory :history do
    association :user, factory: :user
    valuation_format {{ "key1": "val1", "key2": "val2"}}
    evolution_format {{ "key1": "val1", "key2": "val2"}}
    format_not_pos {{ "key1": "val1", "key2": "val2"}}
  end
end
