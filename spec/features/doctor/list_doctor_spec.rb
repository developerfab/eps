require 'rails_helper'

feature "Show information doctor", type: "request" do
  before do
    @doctor1 = FactoryGirl.create(:doctor)
    @doctor2 = FactoryGirl.create(:doctor)
    @functionary = FactoryGirl.create(:functionary)

    # login
    params = { email: @functionary.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    @rta = response
  end
  context "An user want show the information" do
    it "of all doctors" do
      params = {}
      get "/api/v1/doctors", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': @rta['access-token'], 'expiry': @rta['expiry'], 'token-type': @rta['token-type'], 'uid': @rta['uid'], 'client': @rta['client'] }
      expect(response.status).to eq(200)
    end
  end
end
