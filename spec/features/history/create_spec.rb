require 'rails_helper'

feature "create an history for an patient", type: "request" do
  before do
    @doctor = FactoryGirl.create(:doctor)
    @patient = FactoryGirl.create(:patient)
  end

  it "As doctor create a history user" do
    # login
    params = { email: @doctor.user.email, password: "12345678" }
    post "/api/v1/auth/sign_in", params.to_json, { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    expect(response.status).to eq(200)
    rta = response

    valuation_format = '{ "motivoConsulta": "", "farmacologicos": "", "enfermedadesFamiliares": "", "enfermedadesPersonales": "", "EnfermedadesPsiquiatricas": "", "Medicamentos": "", "DatosSocioDemograficos": "", "HallasgosImportantes": "", "EvolucionPsicologia": "", "ImpresionDiagnostica": "", "ConductaSeguir": "", "Pruebas": "", "Diagnostico": "" }'

    evolution_format = '{ "Objetivo": "", "DesarrolloSesión": "", "EvoluciónPaciente": "", "ConductaSeguir": "", "DiagnosticoPrincipal": "" }'
    format_not_pos = '{ "procedimientos": "" }'
    params = { user: @patient.id , valuation_format: valuation_format, evolution_format: evolution_format, format_not_pos: format_not_pos}
    post "/api/v1/histories", params.to_json, { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json', 'access-token': rta['access-token'], 'expiry': rta['expiry'], 'token-type': rta['token-type'], 'uid': rta['uid'], 'client': rta['client'] }
    expect(response.status).to eq(200)
    puts response.body
  end
end
