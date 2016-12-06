require 'rails_helper'

feature "Create a admin", type: "request" do
  context "An admin want create an admin" do
    it "and send the information in petition post" do
      params = { 
                  email: "admin@email.com", 
                  password: "12345678", 
                  password_confirmation: "12345678",
                  document: "321321", 
                  type: "admin",
      }
      post "/api/v1/auth", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      user = Admin.last
      expect(user.email).to eq "admin@email.com"
      expect(user.document).to eq "321321"
    end
  end
end
