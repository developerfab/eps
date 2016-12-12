require 'rails_helper'

feature "Sign up attendants", type: "request" do
  before do
    @user = FactoryGirl.create(:patient)
    @functionary = FactoryGirl.create(:functionary)
    # login
    params = { email: @functionary.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    @rta = response
  end
  context "When a user have a attendant" do
    it "the attendant should be able by register" do
      params = { document: "321321", name: "Juan", last_name: "Perez", address: "Avenida siempre viva 123", relationship: "ESPOSA",  phone: "3333333", user: @user.id}
      post "/api/v1/attendants", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': @rta['access-token'], 'expiry': @rta['expiry'], 'token-type': @rta['token-type'], 'uid': @rta['uid'], 'client': @rta['client'] }
      expect(response.status).to eq(200)
      user = Patient.last
      attendants = Attendants.last
      expect(attendants.name).to eq "Juan"
      expect(attendants.last_name).to eq "Perez"
      expect(attendants.address).to eq "Avenida siempre viva 123"
      expect(attendants.relationship).to eq "ESPOSA"
      expect(attendants.phone).to eq "3333333"
      expect(user.attendants.document).to eq "321321"
    end
  end
end
