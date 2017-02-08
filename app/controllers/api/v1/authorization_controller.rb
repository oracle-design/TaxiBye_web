class Api::V1::AuthorizationController < Api::V1::BaseController
  skip_before_action :authenticate_token!, only: [:create]

  def create
    api_key = request.headers[:ApiKey]
    device_id = request.headers[:DeviceID]

    auth_token = AuthorizationService.new(api_key: api_key, device_id: device_id, params: login_params).apply_token!

    render json: {
      data: {
        authToken: auth_token
      }
    }, status: :accepted

  rescue StandardError => error
    render_error_message(error.message)
  end

  private

  def login_params
    params.require(:data).permit(:email, :password)
  rescue ActionController::ParameterMissing
    {}
  end

  def render_error_message(message)
    render json: { errors: [message] }, status: :unauthorized
  end
end
