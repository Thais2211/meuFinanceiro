class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 's3cr3t')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]

      begin
        JWT.decode(token, 's3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    return @current_user if @current_user.present?

    decoded = decoded_token
    @current_user = User.find_by(id: decoded[0]['user_id']) if decoded.present?
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Você precisa está logado para esse tipo de requisição.' }, status: :unauthorized unless logged_in?
  end
end