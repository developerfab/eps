require 'rails_helper'

feature "Show list services", type: "request" do
  let(:functionary){ FactoryGirl.create(:functionary)}
  before do
    FactoryGirl.create(:service)
    FactoryGirl.create(:service, name: "FONOAUDIOLOGIA")
    FactoryGirl.create(:service, name: "PSICOLOGIA")
    FactoryGirl.create(:service, name: "GENERAL")
    FactoryGirl.create(:service, name: "CARDIOLOGIA")
  end
  context "An functionary want show" do
    it "list with all services" do
      # login
      params = { email: functionary.email, password: "12345678" }
      post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      @rta = response

      params = {}
      get "/api/v1/services", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': @rta['access-token'], 'expiry': @rta['expiry'], 'token-type': @rta['token-type'], 'uid': @rta['uid'], 'client': @rta['client'] }
      expect(response.status).to eq(200)
    end
  end
end
