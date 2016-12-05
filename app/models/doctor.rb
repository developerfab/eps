class Doctor < ActiveRecord::Base
  has_one :user
  belongs_to :cites
end
