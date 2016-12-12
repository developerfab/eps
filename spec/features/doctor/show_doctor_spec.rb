require 'rails_helper'
require 'json'

feature "Show information doctor", type: "request" do
  before do
    @functionary = FactoryGirl.create(:functionary)
    @doctor = FactoryGirl.create(:doctor)
  end

  it "show information specific doctor and exist" do
    # login
    params = { email: @functionary.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    rta = response

    get "/api/v1/doctors/#{@doctor.id}", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
    expect(response.status).to eq(200)

    puts "**"*10
    puts body
    puts "**"*10

    body = JSON.parse(response.body)
    expect(body["id"]).to eq(@doctor.id)
    expect(body["speciality"]).to eq(@doctor.speciality)
    expect(body["medical_license"]).to eq(@doctor.medical_license)
    expect(body["schedule"]).to eq(@doctor.schedule)
    expect(body["worked_days"]).to eq(@doctor.worked_days)
    user = body["user"]
    expect(user["name"]).to eq(@doctor.user.name)
    expect(user["last_name"]).to eq(@doctor.user.last_name)
    expect(user["document"]).to eq(@doctor.user.document)
    expect(user["gender"]).to eq(@doctor.user.gender)
    expect(user["phone"]).to eq(@doctor.user.phone)
  end

  it "show information specific doctor but dont exist" do
    # login
    params = { email: @functionary.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    rta = response

    get "/api/v1/doctors/500", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
    expect(response.status).to eq(200)
    body = JSON.parse(response.body)
    expect(body["message"]).to eq("Usuario no encontrado")
  end
end
