class AuthorizationService
  MissingApiKey = Class.new(StandardError)
  MissingDeviceID = Class.new(StandardError)
  WrongPassword = Class.new(StandardError)
  UserNotFound = Class.new(StandardError)

  def initialize(args = {})
    @api_key = args.fetch(:api_key)
    @device_id = args.fetch(:device_id)
    @params = args.fetch(:params)

    raise MissingApiKey, 'missing api key.' if @api_key.blank?
    raise MissingDeviceID, 'missing device ID.' if @device_id.blank?
  end

  def apply_token!
    authenticate_user! if login_params_provided?
    # @app_client = AppClientKey.find_by(secret_key: @app_key)
    # @device = User::Device.find_by(device_id: @device_id)
    JsonWebToken.encode(setup_payload)
  end

  private

  def login_params_provided?
    @params[:email].present? && @params[:password].present?
  end

  def authenticate_user!
    user = User.find_by(email: @params[:email])

    raise UserNotFound, 'wrong email, user not found.' if user.nil?

    @user_info = { sub: user.id, is_registered: true }

    raise WrongPassword, 'wrong password.' unless user.valid_password? @params[:password]
  end

  def setup_payload
    payload = { device_id: 1, app_id: 2, is_registered: false }
    payload.merge!(@user_info) if login_params_provided?

    payload
  end
end
