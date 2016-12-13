class Api::HistoriesController < Api::SiteController
  require 'json'

  def create
    valuation_format = JSON.parse(params[:valuation_format])
    evolution_format = JSON.parse(params[:evolution_format])
    format_not_pos = JSON.parse(params[:format_not_pos])
    @history = History.create!(user_id: params[:user], valuation_format: valuation_format, evolution_format: evolution_format, format_not_pos: format_not_pos)
    if @history.persisted?
      response = {status: "ok", message: "Historia creada exitosamente" }
    else
      response = {status: "error", message: "La historia no pudo ser creada" }
    end
    respond_to do |format|
      format.json {render json: response}
    end
  end

  def show
    @history = History.find(params[:id])
    respond_to do |format|
      format.json {render layout: false}
    end
  end
end
