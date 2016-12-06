json.doctors @doctors, :id, :speciality, :medical_license, :schedule, :worked_days

json.users @doctors do |doctor|
  json.(doctor.user, :name, :last_name, :document, :birthdate, :gender, :phone, :type)
end
