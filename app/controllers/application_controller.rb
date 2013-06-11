class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private


  def current_user
    # find the user by user_id stored in the session
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

end
