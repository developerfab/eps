require 'rails_helper'
require 'json'

feature "Information patient", type: "request" do
  before do
    @functionary = FactoryGirl.create(:functionary)
    @patient = FactoryGirl.create(:patient)
  end
  it "Show information patient" do
    # login
    params = { email: @functionary.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    rta = response

    params = {}
    get "/api/v1/users/#{@patient.id}", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
    expect(response.status).to eq(200)
    puts response.body
    body = JSON.parse(response.body)
    expect(body["name"]).to eq(@patient.name)
    expect(body["last_name"]).to eq(@patient.last_name)
    expect(body["document"]).to eq(@patient.document)
    expect(body["gender"]).to eq(@patient.gender)
    expect(body["phone"]).to eq(@patient.phone)
    expect(body["email"]).to eq(@patient.email)
    additional = body["additional_information_user"]
    expect(additional["blood_type"]).to eq(@patient.additional_information_user.blood_type)
    expect(additional["civil_status"]).to eq(@patient.additional_information_user.civil_status)
    expect(additional["occupation"]).to eq(@patient.additional_information_user.occupation)
    expect(additional["live_with"]).to eq(@patient.additional_information_user.live_with)
    expect(additional["religion"]).to eq(@patient.additional_information_user.religion)
    expect(additional["companion"]).to eq(@patient.additional_information_user.companion)
    expect(additional["place_of_birth"]).to eq(@patient.additional_information_user.place_of_birth)
    expect(additional["state"]).to eq(@patient.additional_information_user.state)
    expect(additional["municipality"]).to eq(@patient.additional_information_user.municipality)
    expect(additional["city"]).to eq(@patient.additional_information_user.city)
    expect(additional["address"]).to eq(@patient.additional_information_user.address)
    expect(additional["cellphone"]).to eq(@patient.additional_information_user.cellphone)
    expect(additional["ethnicity"]).to eq(@patient.additional_information_user.ethnicity)
    expect(additional["education_level"]).to eq(@patient.additional_information_user.education_level)
  end
end
