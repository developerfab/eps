json.user @information do |information| 
  json.(information, :id, :date_cite , :end_cite)
  json.(information.patient, :id, :name, :last_name, :document )
  json.(information.doctor, :id, :speciality, :medical_license, :schedule, :worked_days)
end
