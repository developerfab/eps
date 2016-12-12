json.(@doctor, :id, :speciality, :medical_license, :schedule, :worked_days)

json.user do
  json.name @doctor.user.name
  json.last_name @doctor.user.last_name
  json.document @doctor.user.document
  json.birthdate @doctor.user.birthdate
  json.gender @doctor.user.gender
  json.phone @doctor.user.phone
end
