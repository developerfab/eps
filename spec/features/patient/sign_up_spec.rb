require 'rails_helper'

feature 'Sign up patient' do
  context "when an user visit the login page" do
    it "the user send post petition", type: :request do
      aditional_information = { blood_type: 'O+', civil_status: "soltero", occupation: "PROFESOR", live_with: ["ESPOSA", "HIJOS"], religion: "AGNOSTICO", companion: "ESPOSA", place_of_birth: "TUNJA", state: "CUNDINAMARCA", municipality: "MUNICIPIO", city: "BOGOTA D.C.", address: "Calle falsa 123", cellphone: "3124444444", ethnicity: "NINGUNA", education_level: "UNIVERSITARIA"}
      params = { email: "test@email.com", password: "12345678", password_confirmation: "12345678", document: "123123", type: "patient", name: "Carlos", last_name: "Moreno", "gender": "MALE", "birthdate": "1990-12-12", phone: "5555555", aditional_information: aditional_information}
      post "/api/v1/auth", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      user = Patient.last
      expect(user.email).to eq "test@email.com"
      expect(user.document).to eq "123123"
      expect(user.type).to eq "Patient"
      additional = user.additional_information_user
      expect(additional.blood_type).to eq ("O+")
      expect(additional.civil_status).to eq("soltero")
      expect(additional.occupation).to eq("PROFESOR")
      expect(additional.live_with).to eq(["ESPOSA", "HIJOS"])
      expect(additional.religion).to eq("AGNOSTICO")
      expect(additional.companion).to eq("ESPOSA")
      expect(additional.place_of_birth).to eq("TUNJA")
      expect(additional.state).to eq("CUNDINAMARCA")
      expect(additional.municipality).to eq("MUNICIPIO")
      expect(additional.city).to eq("BOGOTA D.C.")
      expect(additional.address).to eq("Calle falsa 123")
      expect(additional.cellphone).to eq("3124444444")
      expect(additional.ethnicity).to eq("NINGUNA")
      expect(additional.education_level).to eq("UNIVERSITARIA")
    end
  end
end
