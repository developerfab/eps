class Api::CitesPatientsController < Api::SiteController
  def show
    params.permit!
    @patient = Patient.find(params[:id])
    @information = Cite.find_by(patient: @patient)
    respond_to do |format|
      format.json {render layout: false}
    end
  end
end
