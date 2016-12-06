require 'rails_helper'

feature "Create servicie", type: "request" do
  context "As admin logged" do
    it "send petition post for create service" do
      @admin = FactoryGirl.create(:admin)
      # login
      params = { email: @admin.email, password: "12345678" }
      post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      rta = response

      params = { name: "FONOAUDIOLOGIA" }
      post "/api/v1/services", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
      expect(response.status).to eq(200)
      cite = Service.last
      expect(cite.name).to eq "FONOAUDIOLOGIA"
    end
  end
end
