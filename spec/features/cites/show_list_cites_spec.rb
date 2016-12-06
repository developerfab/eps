require 'rails_helper'

feature 'An user want a show list cites' do
  context "and is logged" do
    before do
      #create functionary
      @functionary = FactoryGirl.create(:functionary)

      # create patient
      @patient = FactoryGirl.create(:patient)

      # create doctor
      @doctor = FactoryGirl.create(:doctor)
    end
    it "as patient" do
      params = { email: @patient.email, password: "12345678" }
      post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      rta = response

      post "/api/v1/cites", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }

    end

    it "as doctor" do
    end

    it "as functionary" do
    end
  end

  context "and is not logged" do
    before do
      #create functionary
      @functionary = FactoryGirl.create(:functionary)

      # create patient
      @patient = FactoryGirl.create(:patient)

      # create doctor
      @doctor = FactoryGirl.create(:doctor)
    end
    it "as patient" do
    end

    it "as doctor" do
    end

    it "as functionary" do
    end
  end
end
