class TasksController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    if @list = List.find_by(id: params[:list_id]) 
      @task = Task.new(list_id: params[:list_id])
    else
      @task = Task.new
      @task.build_list
    end
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    if @task.save!
      redirect_to list_path(@task.list_id)
    else
      render :new
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    flash[:notice] = "Task deleted."
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:summary, :assignee, :list_id, list_attributes: [:summary, :description, :id, :team_id])
  end
end
