class Doctor < ActiveRecord::Base
  has_one :user
  has_many :cites
end
