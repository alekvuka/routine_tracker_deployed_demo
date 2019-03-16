class RoutinesController < ApplicationController

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @routine = Routine.new
  end

  def create
    #binding.pry
    @routine = Routine.create(routine_params)
    @routine.originator_id = User.find(params[:user_id]).id
    @routine.users << User.find(params[:user_id])
    @routine.save
    redirect_to user_path(User.find(params[:user_id]))
  end

  def edit
    @routine = Routine.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @routine = Routine.find(params[:id])
    @routine.update(routine_params)
    redirect_to user_path(User.find(params[:user_id]))
  end

  def show
    @routine = Routine.find(params[:id])
  end

  def destroy
  end

  def routine_params
    params.require(:routine).permit(:name, :start_time, :end_time, :originator_id)
  end

end
