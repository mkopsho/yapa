class TasksController < ApplicationController
  def new
    @task = Task.new
    @task.build_list
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    if @task.save!
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:summary, :assignee, :list_id, list_attributes: [:summary, :description])
  end
end
