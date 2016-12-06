class Api::DoctorsController < Api::SiteController
  def index
    @doctors = Doctor.all
    respond_to do |format|
      format.json {render layout: false}
    end
  end
end
