class Api::DoctorsController < Api::SiteController
  def index
    @doctors = Doctor.all
    respond_to do |format|
      format.json {render layout: false}
    end
  end

  def show
    begin
      @doctor = Doctor.find(params[:id])
      respond_to do |format|
        format.json {render layout: false}
      end
    rescue
      response = {status: "error", message: "Usuario no encontrado" }
      respond_to do |format|
        format.json {render json: response}
      end
    end
  end
end
