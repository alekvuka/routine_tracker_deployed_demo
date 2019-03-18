require 'pry'

class UsersController < ApplicationController

  #before_action :load_user, only: [:edit, :update]
  #t


  def index
  end

  def add_routine

    User.find(params[:user_id]).routines << Routine.find(params[:routine_id])
    User.find(params[:user_id]).save

    redirect_to user_path(User.find(params[:user_id]))

  end

  def my_routines
  end

  def my_tasks
  end 

  def new
    @user = User.new
  end

  def create

    @user = User.create(user_params)

    if @user.valid? != true
      flash[:messages] = @user.errors.full_messages
      redirect_to new_user_path
    else
      session[:id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def edit
  end

  def update
    if !params[:user][:routine_to_delete].nil?
      User.find(params[:id]).routines.delete(Routine.find(params[:user][:routine_to_delete]))
      #find all tasks where the routine_id is the routine chosen and user_id is the user and delete those tasks


      User.find(params[:id]).save
      redirect_to user_path(User.find(params[:id]))
    end
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

end
