class Api::PatientsController < Api::SiteController

  def index
    @patients = Patient.all
    respond_to do |format|
      format.json {render layout: false}
    end
  end

  def show
    @patient = Patient.find(params[:id])
    respond_to do |format|
      format.json {render layout: false}
    end
  end
end
