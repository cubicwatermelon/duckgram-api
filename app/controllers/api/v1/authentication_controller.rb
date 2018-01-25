class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [:login]

  def login
    authenticate(params[:email], params[:password])
  end

  def test
    render json: { message: 'Authenticated' }
  end

  private

    def user_params
      params.permit(:name, :email, :password)
    end

    def authenticate(email, password)
      command = AuthenticateUserService.call(email, password)

      if command.success?
        debugger
        render json: {
          access_token: command.result[:auth_token],
          user_id: command.result[:user_id],
          message: 'Login Successful'
        }
      else
        render json: { error: command.errors }, status: :unauthorized
      end
    end
end