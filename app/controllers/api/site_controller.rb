class Api::SiteController < ApplicationController

  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
     flash[:error] = "Access denied!"
     redirect_to root_path
  end
end
