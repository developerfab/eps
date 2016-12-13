require 'rails_helper'

feature "History of an patient", type: "request" do
  before do
    @patient = FactoryGirl.create(:patient)
    @patient2 = FactoryGirl.create(:patient)
    @doctor = FactoryGirl.create(:doctor)
    @history = FactoryGirl.create(:history, user_id: @patient.id)
    @history2 = FactoryGirl.create(:history, user_id: @patient.id)
  end

  it "Show history of an patient" do
    # login
    params = { email: @doctor.user.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    rta = response

    params = { id: @history.id }
    get "/api/v1/histories/#{@history.id}", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
    expect(response.status).to eq(200)
    puts "**"*10
    puts response
    puts "**"*10
    puts response.body
  end

  it "Show all histories of an patient" do
    # login
    params = { email: @doctor.user.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    rta = response

    params = { id: @patient.id }
    get "/api/v1/histories_patients/#{@patient.id}", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
    expect(response.status).to eq(200)
    puts response.body
  end

  it "Show all histories of an patient but haven't" do
    # login
    params = { email: @doctor.user.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    rta = response

    params = { id: @patient2.id }
    get "/api/v1/histories_patients/#{@patient2.id}", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
    expect(response.status).to eq(200)
    puts response.body
  end
end
