require 'rails_helper'

feature 'An user want a show list cites', type: "request" do
  context "and is logged" do
    before do
      #create functionary
      @functionary = FactoryGirl.create(:functionary)

      # create patient
      @patient = FactoryGirl.create(:patient)

      # create doctor
      @doctor = FactoryGirl.create(:doctor)
      @cite = FactoryGirl.create(:cite, patient: @patient, doctor: @doctor)
      @cite = FactoryGirl.create(:cite, doctor: @doctor)
    end
    it "as user" do
      params = { email: @patient.email, password: "12345678" }
      post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      rta = response

      get "/api/v1/cites", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
      puts "**"*10
      puts response.body
    end

    it "delete cite" do
      params = { email: @patient.email, password: "12345678" }
      post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      rta = response

      params = { id: @cite.id }
      delete "/api/v1/cites/#{@cite.id}", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
      puts "**"*10
      puts response.body
    end

    it "as doctor" do
      params = { email: @doctor.user.email, password: "12345678" }
      post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      rta = response

      params = { id: @doctor.id }
      get "/api/v1/cites_doctors/#{@doctor.id}", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
      puts "**"*10
      puts response.body
    end
  end
end
