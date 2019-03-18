class TasksController < ApplicationController

  def index
  end

  def show
    @task = Task.find(params[:id])
  end

end
