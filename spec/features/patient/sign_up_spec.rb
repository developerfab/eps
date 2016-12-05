require 'rails_helper'

feature 'Sign up patient' do
  context "when an user visit the login page" do
    it "the user send post petition", type: :request do
      params = { email: "test@email.com", password: "12345678", password_confirmation: "12345678", document: "123123", type: "patient"}
      post "/api/v1/auth", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      user = Patient.last
      expect(user.email).to eq "test@email.com"
      expect(user.document).to eq "123123"
      expect(user.type).to eq "Patient"
    end
  end
end
