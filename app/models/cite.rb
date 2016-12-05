class Cite < ActiveRecord::Base
  has_one :doctor
  has_one :user
end
