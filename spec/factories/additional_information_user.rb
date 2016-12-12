FactoryGirl.define do
  factory :additional_information_user do
    blood_type "O+"
    civil_status "SOLTERO"
    occupation "PROFESOR"
    live_with ["ESPOSA", "HIJOS"]
    religion "AGNOSTICO"
    companion "ESPOSA"
    place_of_birth "TUNJA"
    state "CUNDINAMARCA"
    municipality "MUNICIPIO"
    city "BOGOTA D.C."
    address "Avenida siempre viva 123"
    cellphone "3124444444"
    ethnicity "NINGUNA"
    education_level "UNIVERSITARIA"
  end
end
