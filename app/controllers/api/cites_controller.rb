class Api::CitesController < Api::SiteController
  def index
    @cites = Cite.all
    respond_to do |format|
      format.json {render layout: false}
    end
  end

  def create
    params.permit!
    @user = Patient.find(params[:patient_id])
    @doctor = Doctor.find(params[:doctor_id])
    @authorized = params[:authorized]=="true" ? true : false
    date = params[:date_cite].to_datetime
    @cite = Cite.create!( patient_id: @user.id, doctor_id: @doctor.id, date_cite: date, authorized: @authorized)
    if @cite.persisted?
      response = {status: "ok", message: "cita registrada exitosamente" }
    else
      response = {status: "error", message: "la cita no pudo ser asignada" }
    end
    respond_to do |format|
      format.json {render json: response}
    end
  end

end
