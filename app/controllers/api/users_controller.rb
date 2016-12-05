class Api::UsersController < Api::SiteController
  before_action :authenticate_user!, only: [:update]

  def create
    response = {}
    @user = User.find_by(email: params[:email])
    if @user
      response = {status: "error", message: "usuario ya registrado previamente" }
    else
      @user = User.create!(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], document: params[:document])
      if @user.persisted?
        response = {status: "ok", message: "usuario registrado exitosamente" }
      else
        response = {status: "error", message: "usuario no pudo ser creado" }
      end
    end

    respond_to do |format|
      format.json {render json: response}
    end

  end

  def update
    user = User.find(params[:id])

    respond_to do |format|
      if user.uuid.eql?(params[:uuid])
        format.json {render json: {status: "ok", message: "uuid ya regitrado previamente"} }
      elsif !user.uuid.eql?(params[:uuid])
        user.update(uuid: params[:uuid])
        format.json {render json: {status: "ok", message: "uuid actualizado satisfactoriamente"} }
      end
    end
  end
end
