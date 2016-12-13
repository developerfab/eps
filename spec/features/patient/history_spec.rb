require 'rails_helper'

feature "History of an patient", type: "request" do
  before do
    @patient = FactoryGirl.create(:patient)
    @doctor = FactoryGirl.create(:doctor)
  end

  it "Show history of an patient" do
  end
end
