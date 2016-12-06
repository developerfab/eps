require 'rails_helper'

feature "Information patient", type: "request" do
  before do
    @functionary = FactoryGirl.create(:functionary)
    @patient = FactoryGirl.create(:patient)
  end
  it "Show information patient" do
    # login
    params = { email: @functionary.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    rta = response

    params = {}
    get "/api/v1/users/#{@patient.id}", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
    expect(response.status).to eq(200)
    puts response
  end
end
