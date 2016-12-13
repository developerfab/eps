class Api::HistoriesPatientsController < Api::SiteController

  def show
    @histories = History.where(user_id: params[:id])
    respond_to do |format|
      format.json {render layout: false}
    end
  end
end
