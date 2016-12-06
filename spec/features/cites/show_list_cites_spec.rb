require 'rails_helper'

feature 'An user want a show list cites' do
  context "and is logged " do
    before do
      #create functionary
      @functionary = FactoryGirl.create(:functionary)

      # create patient
      @patient = FactoryGirl.create(:patient)

      # create doctor
      @doctor = FactoryGirl.create(:doctor)
    end
    it "as patient" do
    end

    it "as doctor" do
    end

    it "as functionary" do
    end
  end
end
