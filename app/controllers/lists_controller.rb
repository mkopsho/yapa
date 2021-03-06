class ListsController < ApplicationController
  include PermissionsHelper
  before_action :logged_in?

  def index
    @lists = List.all
  end

  def new
    if @team = Team.find_by(id: params[:team_id])
      if !@team.users.include?(current_user)
        team_permissions_check
      else
        @list = List.new(team_id: params[:team_id])
        @list.tasks.build
      end
    else
      @list = List.new
      @list.tasks.build
    end
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

  def edit
    @list = List.find_by(id: params[:id])
    list_permissions_check
  end

  def update
    @list = List.find_by(id: params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find_by(id: params[:id])
    if !@list.team.users.include?(current_user)
      list_permissions_check
    else
      @list.destroy
      flash[:notice] = "List deleted."
      redirect_to lists_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:summary, :description, :team_id, tasks_attributes: [:summary, :assignee, :id])
  end
end
