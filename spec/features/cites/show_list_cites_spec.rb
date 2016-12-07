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
    end
    it "as user" do
      params = { email: @patient.email, password: "12345678" }
      post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      rta = response

      get "/api/v1/cites", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }

    end
  end
end
