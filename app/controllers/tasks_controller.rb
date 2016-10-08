class TasksController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, :except => [:index]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find params[:id]
  end

  def create
    @task = Task.new create_params

    if @task.save
      flash[:success] = "Task was successfully created."
      render :show
    else
      flash[:error] = "Task was not able to be created."
      render :new
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]

    if @task.update_attributes update_params
      flash[:success] = "Task updated."
      render :show
    else 
      flash[:error] = "Task could not be updated."
      render :edit
    end
  end

  def destroy
    @task = Task.find params[:id]

    if @task.destroy
      flash[:success] = "Task deleted."
      render :index
    else 
      flash[:error] = "Task was not able to be deleted."
      render :index
    end 
  end

  private 
  def create_params
    params.require(:task).permit(:name, :description, :related_url)
  end
  
  def update_params
    create_params 
  end
end
