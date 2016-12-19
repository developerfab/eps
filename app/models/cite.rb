class Cite < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  belongs_to :service
  has_one :bill
end
