class Api::PaymentsController < Api::SiteController

  def create
    begin
      @cite = Cite.find(params[:cite_id])
    rescue 
      response = {status: "error", message: "Error en el id de la cita" }
    end
    if @cite
      @payment = Bill.create!(cite_id: @cite.id, amount: params[:amount])
      if @payment
        response = {status: "ok", message: "Pago registrado exitosamente" }
      else
        response = {status: "error", message: "Error al registrar el pago" }
      end
    end
    respond_to do |format|
      format.json {render json: response}
    end
  end

end
