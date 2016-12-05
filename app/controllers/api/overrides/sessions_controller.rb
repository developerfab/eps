class Api::Overrides::SessionsController < DeviseTokenAuth::SessionsController
  def create
    super
  end

  protected

  def render_create_success
    render json: @resource
  end
end
