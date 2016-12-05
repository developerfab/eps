require 'rails_helper'

feature "Sign up doctor" do
  context "An admin want create a doctor", type: "request" do
    it "the admin send a petition post" do
      params = { 
                  email: "doctor@email.com", 
                  password: "12345678", 
                  password_confirmation: "12345678",
                  document: "321321", 
                  type: "doctor",
                  speciality: "GENERAL",
                  medical_license: "123321",
                  schedule: "7 AM - 4 PM",
                  worked_days: [ "LUNES", "MIERCOLES", "VIERNES"]
      }
      post "/api/v1/auth", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      doctor = Doctor.last
      expect(doctor.user.email).to eq "doctor@email.com"
      expect(doctor.user.document).to eq "321321"
    end
  end
end
