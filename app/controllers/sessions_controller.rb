require 'pry'

class SessionsController < ApplicationController

  def create

    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      redirect_to user_path(user)
    else
      flash[:alert] = "Email or password is invalid"
      redirect_to users_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
