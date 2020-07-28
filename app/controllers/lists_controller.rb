class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @list.tasks.build
  end

  def create
    @list = List.new(list_params)
    if @list.save!
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def show
    @list = List.find_by(id: params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:summary, :description, :user_id, :team_id, tasks_attributes: [:summary, :assignee])
  end
end
