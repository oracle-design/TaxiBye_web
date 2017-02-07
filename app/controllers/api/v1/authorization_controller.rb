class Api::V1::AuthorizationController < Api::V1::BaseController
  skip_before_action :authenticate_token!, only: [:create]

  def create
    user = User.find_by(email: params[:data][:email])

    return render json: { errors: ['Invalid Email.'] }, status: :unauthorized if user.nil?

    if user.valid_password? params[:data][:password]
      render json: {
        data: {
          authToken: JsonWebToken.encode(sub: user.id)
        }
      }, status: :accepted
    else
      render json: { errors: ['Invalid Email or password.'] }, status: :unauthorized
    end
  end
end
