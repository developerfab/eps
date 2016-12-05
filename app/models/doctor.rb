class Doctor < ActiveRecord::Base
  has_one :user
end
