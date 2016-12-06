require 'rails_helper'

feature "An user can have a cite" do
  context "An functionary want create a cite", type: "request" do
    before do
      #create functionary
      @functionary = FactoryGirl.create(:functionary)

      # create patient
      @patient = FactoryGirl.create(:patient)

      # create doctor
      @doctor = FactoryGirl.create(:doctor)
    end

    it "the user send petition post" do
      # login
      params = { email: @functionary.email, password: "12345678" }
      post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      rta = response

      # create cite
      params = { 
                  patient_id: @patient.id, 
                  doctor_id: @doctor.id, 
                  date_cite: "2016-12-12 10:00", 
                  end_cite: "2016-12-12 10:20", 
                  authorized: true
      }
      post "/api/v1/cites", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
      expect(response.status).to eq(200)
      cite = Cite.last
      expect(cite.patient).to eq @patient
      expect(cite.doctor).to eq @doctor
    end
  end
end
