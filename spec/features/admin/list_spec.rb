require 'rails_helper'

feature "List all admins", type: "request" do
  before do
    @admin = FactoryGirl.create(:admin)
    @admin2 = FactoryGirl.create(:admin)
    @admin3 = FactoryGirl.create(:admin)
  end

  it "Admin show information of an admin" do
    # login
    params = { email: @admin.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    rta = response
    params = { id: @admin2.id }
    get "/api/v1/users/#{@admin2.id}", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
    expect(response.status).to eq(200)
    puts "**"*10
    puts response.body
  end
end
