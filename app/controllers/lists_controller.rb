class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = List.where(user: current_user)
    @tasks = Task.all.almost_due 
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new(list_id: @list.id)
    @tasks = @list.tasks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user

    if @list.save
      flash[:notice] = "To Do List saved."
      redirect_to lists_path
    else
      flash[:error] = "There was an error saving your To Do List. Please try again."
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id])

    if @list.destroy
      flash[:notice] = "To Do List removed."
      redirect_to lists_path
    else
      flash[:error] = "There was a problem removing your List.  Please try again."
      render :show
    end
  end

  private
    def list_params
      params.require(:list).permit(:title)
    end
end
