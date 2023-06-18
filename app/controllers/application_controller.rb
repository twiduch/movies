class ApplicationController < ActionController::Base
  def authenticate_request
    return true if current_user

    raise AppErrors::NotAuthorizedError, 'Not authenticated'
  end

  def current_user
    @current_user ||= user_id && User.find_by(id: user_id)
  end

  def user_id
    session[:user_id]
  end
end
