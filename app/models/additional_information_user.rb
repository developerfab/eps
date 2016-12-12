class AdditionalInformationUser < ActiveRecord::Base
  validates :blood_type, :civil_status, presence: true

  def self.registration(params, user)
    @additional = AdditionalInformationUser.new()
    @additional.blood_type = params[:blood_type]
    @additional.civil_status= params[:civil_status]
    @additional.occupation = params[:occupation]
    @additional.live_with = params[:live_with]
    @additional.religion = params[:religion]
    @additional.companion = params[:companion]
    @additional.place_of_birth = params[:place_of_birth]
    @additional.state = params[:state]
    @additional.municipality = params[:municipality]
    @additional.city = params[:city]
    @additional.address = params[:address]
    @additional.cellphone = params[:cellphone]
    @additional.ethnicity = params[:ethnicity]
    @additional.education_level = params[:education_level]
    @additional.user_id = user.id
    @additional.save! ? true : false
  end
end
