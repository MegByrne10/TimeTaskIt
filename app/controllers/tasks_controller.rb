class TasksController < ApplicationController
  def new

  end

  def create
    @list = List.find(params[:list_id])
    @tasks = @list.tasks

    @task = current_user.tasks.build(params[:task])
    @task.list = @list

    if@task.save
      flash[:notice] = "New task was created."
      redirect_to lists_path
    else
      flash[:error] = "There was a problem saving the task."
      redirect_to lists_path
    end
  end

  def destroy
  end
end
