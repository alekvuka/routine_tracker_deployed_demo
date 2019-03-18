class RoutinesController < ApplicationController

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @routine = Routine.new
  end

  def create
    @routine = Routine.create(routine_params)
    @routine.originator_id = User.find(params[:user_id]).id
    @routine.users << User.find(params[:user_id])
    @routine.add_tasks(params[:task], params[:user_id])
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
    @routine.tasks.clear

    params[:routine][:task_ids].each do |task|
        if !task.empty?
          task = Task.find(task)
          @routine.tasks << task
          task.save
        end
     end

     params[:task].each do |key, value|
       if !value.empty?
         task = Task.find_or_create_by(name: value)
         @routine.tasks << task
         task.add_user(user)
         task.save
       end
     end

    #@routine.add_tasks(params[:task], params[:user_id])
    @routine.save
    redirect_to user_path(User.find(params[:user_id]))

  end

  def show
    @routine = Routine.find(params[:id])
  end

  def destroy
  end

  def routine_params
    params.require(:routine).permit(:name, :start_time, :end_time, :originator_id, :task_ids)
  end

end
