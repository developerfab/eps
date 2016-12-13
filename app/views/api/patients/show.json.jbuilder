json.(@patient, :name, :last_name, :document, :birthdate, :gender, :type, :phone, :email )

json.additional_information_user do
  json.(@patient.additional_information_user, :blood_type, :civil_status, :occupation, :live_with, :religion, :companion, :place_of_birth, :state, :municipality, :city, :address, :cellphone, :ethnicity, :education_level)
end
