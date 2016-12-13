require 'rails_helper'

feature "List of general information of a patient", type: "request" do
  before do
    @patient = FactoryGirl.create(:patient)
    @patient2 = FactoryGirl.create(:patient)
    @patient3 = FactoryGirl.create(:patient)
    @functionary = FactoryGirl.create(:functionary)
  end

  it "An functionary should be able to show a list with all patients" do
    # login
    params = { email: @functionary.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    rta = response

    params = {}
    get "/api/v1/patients", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
  end
end
