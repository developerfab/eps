require 'rails_helper'

feature 'Sign up patient' do
  context "when an user visit the login page" do
    it "the user can register in the platform" do
      visit new_user_registration_path

      expect(page).to have_content("Registro como paciente")
      fill_in "Nombre", with: "Carlos"
      fill_in "Apellido", with: "Moreno"
      fill_in "Documento", with: "1023921320"
      fill_in "Correo electrónico", with: "testpatient@gmail.com"
      fill_in "Contraseña", with: "12345678"
      fill_in "Re-contraseña", with: "12345678"
      click_button "Registrarme"

      expect(page).to have_content("Te has registrado exitosamente")
      user = Patient.last
      expect(user.email).to eq "testpatient@gmail.com"
      expect(user.name).to eq "Carlos"
      expect(user.last_name).to eq "Moreno"
    end
  end
end
