class TasksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(task_params)
    @task.user = current_user
    #@task.list = @list

    if @task.save!
      flash[:notice] = "New task was created."
      redirect_to list_path(@list)
    else
      flash[:error] = "There was a problem saving the task."
      redirect_to list_path(@list)
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.user = current_user

    if @task.destroy
      flash[:notice] = "Task Completed!"
      redirect_to lists_path(@list)
    else
      flash[:error] = "There was a problem removing your Task.  Please try again."
    end
  end

  private
    def task_params
      params.require(:task).permit(:description, :time_goal)
    end
end
