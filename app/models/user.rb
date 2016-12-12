class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates :email, :document, uniqueness: true

  belongs_to :doctor
  belongs_to :cite
  has_one :additional_information_user
  has_one :attendants
end
