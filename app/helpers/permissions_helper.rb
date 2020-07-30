module PermissionsHelper
  def team_permissions_check
    if !@team.users.include?(current_user)
      flash[:error] = "You do not have the correct permissions to do that."
      redirect_to team_path(@team)
    end
  end

  def task_permissions_check
    if !@task.list.team.users.include?(current_user)
      flash[:error] = "You do not have the correct permissions to do that."
      redirect_to task_path(@task)
    end
  end

  def list_permissions_check
    if !@list.team.users.include?(current_user)
      flash[:error] = "You do not have the correct permissions to do that."
      redirect_to list_path(@list)
    end
  end
end
