class SessionController < ApplicationController
  def new

  end

  def create
    #fetch the user email & password from params
    session_user = params[:session]
    # Find the user by email

    user = User.find_by_email(session_user[:email])
    #check if the password is correct
    # if password is correct -> show a welcome message + redirect to account section
    if user and user.authenticate(session_user[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in successfully."

    else
      # if there is no user by that email show error
      # or  if password is wrong -> show error
      redirect_to login_url, notice: "Invalid email/password."
    end
  end

  def destroy
    #user_id in session to nil
    session[:user_id] = nil
    @current_user = nil

    #redirect

    redirect_to root_url, notice: "Logged out."

  end

end
