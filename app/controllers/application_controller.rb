class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_accessor :current_user
  
  include ExceptionHandler

  def current_user
    @current_user
  end

  private
    def authenticate_request
      @current_user = AuthorizeApiRequestService.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
end
