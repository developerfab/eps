class Api::AttendantsController < Api::SiteController

  def create
    @attendants = Attendants.create!(document: params[:document], name: params[:name], last_name: params[:last_name], address: params[:address], relationship: params[:relationship], phone: params[:phone], user_id: params[:user])
    if @attendants
      response = {status: "ok", message: "Acudiente registrado exitosamente" }
    else
      response = {status: "error", message: "El acudiente no ha podido ser registrado" }
    end
    respond_to do |format|
      format.json {render json: response}
    end
  end
end
