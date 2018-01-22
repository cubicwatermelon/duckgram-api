class AuthorizeApiRequestService
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    set_user
  end

  private

  attr_reader :headers

  def set_user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(extract_authorization_token)
  rescue
  end

  # extracts authorization header from the http request
  def extract_authorization_token
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end
