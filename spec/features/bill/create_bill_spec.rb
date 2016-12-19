require 'rails_helper'
require 'json'

feature "Create bill", type: "request" do

  let (:functionary) { FactoryGirl.create(:functionary)}
  let(:cite){ FactoryGirl.create(:cite)}

  context "An functionary pay an cite" do

    before do
      #login
      params = { email: functionary.email, password: "12345678" }
      post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      expect(response.status).to eq(200)
      @rta = response
    end

    it "and the cite exist" do
      params = { cite_id: cite.id, amount: "2000"}
      post "/api/v1/cites/#{cite.id}/payments", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': @rta['access-token'], 'expiry': @rta['expiry'], 'token-type': @rta['token-type'], 'uid': @rta['uid'], 'client': @rta['client'] }
      expect(response.status).to eq(200)

      body = JSON.parse(response.body)
      bill = Bill.last
      expect(body["message"]).to eq "Pago registrado exitosamente"
      expect(bill.cite_id).to eq cite.id
      expect(bill.amount).to eq "2000"
    end

    it "and the cite don't extist" do
      params = { cite_id: "2300", amount: "2000"}
      post "/api/v1/cites/2300/payments", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': @rta['access-token'], 'expiry': @rta['expiry'], 'token-type': @rta['token-type'], 'uid': @rta['uid'], 'client': @rta['client'] }
      expect(response.status).to eq(200)

      body = JSON.parse(response.body)
      expect(body["message"]).to eq "Error en el id de la cita"
    end
  end
end
