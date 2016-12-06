require 'rails_helper'

feature "Create functionary", type: "request" do
  context "An admin want create and functionary" do
    it "and send the information in petition post" do
      params = { 
                  email: "functionary@email.com", 
                  password: "12345678", 
                  password_confirmation: "12345678",
                  document: "321321", 
                  type: "functionary",
      }
      post "/api/v1/auth", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      user = Functionary.last
      expect(user.email).to eq "functionary@email.com"
      expect(user.document).to eq "321321"
    end
  end
end
