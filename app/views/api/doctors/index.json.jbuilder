json.doctors @doctors do |doctor|
  json.(doctor, :id, :speciality, :medical_license, :schedule, :worked_days)
  json.user do
    json.(doctor.user, :name, :last_name, :document, :birthdate, :gender, :phone, :type)
  end
end
