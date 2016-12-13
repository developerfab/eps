class Api::UsersController < Api::SiteController
  before_action :authenticate_user!, only: [:update]
  skip_before_action :verify_authenticity_token, only: [:create]

  require 'json'

  def index
    @users = User.all
    respond_to do |format|
      format.json {render layout: false}
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json {render layout: false}
    end
  end

  def create
    response = {}
    type = params['type']
    if type == "patient"
      response = create_patient(params)
    elsif type == "doctor"
      response = create_doctor(params)
    elsif type == "functionary"
      response = create_functionary(params)
    elsif type == "admin"
      response = create_admin(params)
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

  private

  def create_patient(params)
    @user = Patient.find_by(email: params[:email])
    if @user
      response = {status: "error", message: "usuario ya registrado previamente" }
    else
      @user = Patient.create!(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], document: params[:document], name: params[:name], last_name: params[:last_name], gender: params[:gender], birthdate: params[:birthdate].to_datetime, phone: params[:phone])
      if @user.persisted?
        @additional = AdditionalInformationUser.registration(params[:aditional_information], @user)
        if @additional
          response = {status: "ok", message: "usuario registrado exitosamente" }
        else
          @user.delete
          response = {status: "error", message: "usuario no pudo ser creado" }
        end
      else
        response = {status: "error", message: "usuario no pudo ser creado" }
      end
    end
  end

  def create_doctor(params)
    @user = User.find_by(email: params[:email])
    if @user
      response = {status: "error", message: "usuario ya registrado previamente" }
    else
      @user = User.create!(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], document: params[:document])
      if @user.persisted?
        @doctor = Doctor.create!( speciality: params[:speciality], medical_license: params[:medical_license], schedule: params[:schedule], worked_days: params[:worked_days])
        if @doctor.persisted?
          @user.update(doctor: @doctor)
          response = {status: "ok", message: "usuario registrado exitosamente" }
        else
          @user.delete
          response = {status: "error", message: "usuario no pudo ser creado" }
        end
      else
        response = {status: "error", message: "usuario no pudo ser creado" }
      end
    end
  end

  def create_functionary(params)
    @functionary = Functionary.find_by(email: params[:email])
    if @functionary
      response = {status: "error", message: "usuario ya registrado previamente" }
    else
      @functionary = Functionary.create!(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], document: params[:document])
      if @functionary.persisted?
        response = {status: "ok", message: "usuario registrado exitosamente" }
      else
        response = {status: "error", message: "usuario no pudo ser creado" }
      end
    end
  end

  def create_admin(params)
    @admin = Admin.find_by(email: params[:email])
    if @admin
      response = {status: "error", message: "usuario ya registrado previamente" }
    else
      @admin = Admin.create!(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], document: params[:document])
      if @admin.persisted?
        response = {status: "ok", message: "usuario registrado exitosamente" }
      else
        response = {status: "error", message: "usuario no pudo ser creado" }
      end
    end
  end
end
