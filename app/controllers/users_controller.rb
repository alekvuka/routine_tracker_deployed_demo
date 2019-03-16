require 'pry'

class UsersController < ApplicationController

  def index
  end

  def add_routine

    
    redirect_to user_path(User.find(params[:user_id]))

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:id] = @user.id
    redirect_to user_path(@user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  #USER ORIGINATOR COLUMN IN ROUTINE TABLE
  #USER HAS MANY TASKS THROUGH ROUTINE
  #USER_ROUTINE TABLE TO LINK USERS AND ROUTINES

  #SEEING ALL THE TASKS FOR A USER -> DO AS NESTED ROUTE
  #HAVE TASKS UNDER USERS

  #ADD A TASK TO A ROUTINE -> NESTED ROUTE

end
