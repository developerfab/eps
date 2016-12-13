require 'rails_helper'

feature "Login user", type: "request" do
  before do 
    @patient = FactoryGirl.create(:patient)
    @doctor = FactoryGirl.create(:doctor)
  end
  it "Login as patient" do
    # login
    params = { email: @patient.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    puts "**"*10
    puts response.body
  end

  it "Login as doctor" do
    # login
    params = { email: @doctor.user.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    puts "**"*10
    puts response.body
  end
end
