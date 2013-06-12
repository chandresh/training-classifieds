class ApplicationController < ActionController::Base
  protect_from_forgery


  private

  def admin?
    current_user && current_user.admin?
  end

  helper_method :admin?

  def member_required
    unless current_user
      redirect_to :login, notice: "Please log in"
    end
  end

  def admin_required
    unless admin?
      redirect_to :login, notice: "Please log in as admin"
    end
  end

  def current_user
    # find the user by user_id stored in the session
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

  helper_method :current_user
end
