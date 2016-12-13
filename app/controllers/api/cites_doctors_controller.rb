class Api::CitesDoctorsController < Api::SiteController
  def show
    params.permit!
    @doctor= Doctor.find(params[:id])
    @information = Cite.where(doctor: @doctor)
    respond_to do |format|
      format.json {render layout: false}
    end
  end
end
