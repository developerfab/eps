json.(@information, :id, :date_cite )

json.user @information do |information| 
  json.(information.patient, :id, :name, :last_name, :document )
  json.(information.doctor :id, :speciality, :medical_license, :schedule, :worked_days)
  json.doctor_user information.doctor do |doctor|
    json.(doctor.user, :name, :last_name, :document, :birthdate, :gender, :phone, :type)
  end
end
