class Api::ServicesController < Api::SiteController
  def create
    params.permit!
    @service = Service.find_by(name: params[:name])
    if @service.nil?
      @service = Service.create!(name: params[:name])
      if @service.persisted?
        response = {status: "ok", message: "Servicio creado exitosamente" }
      else
        response = {status: "error", message: "El servicio no pudo ser creado" }
      end
    else
      response = {status: "error", message: "Ya existe un servicio con ese nombre" }
    end
    respond_to do |format|
      format.json {render json: response}
    end
  end
end
