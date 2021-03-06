class TasksController < ApplicationController
  include PermissionsHelper
  before_action :logged_in?

  def index
    if @list = List.find_by(id: params[:list_id])
    else
      @lists = List.all
    end
  end

  def new
    if @list = List.find_by(id: params[:list_id])
      if !@list.team.users.include?(current_user)
        list_permissions_check
      else
        @task = Task.new(list_id: params[:list_id])
      end
    else
      @task = Task.new
      @task.build_list
    end
  end

  def create
    @task = Task.new(task_params)
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
    task_permissions_check
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
    if !@task.list.team.users.include?(current_user)
      task_permissions_check
    else
      @task.destroy
      flash[:notice] = "Task deleted."
      redirect_to tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:summary, :assignee, :list_id, list_attributes: [:summary, :description, :id, :team_id])
  end
end
