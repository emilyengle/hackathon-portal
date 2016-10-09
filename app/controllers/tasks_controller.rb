class TasksController < ApplicationController
  before_action :determine_scope, :only => [:index]
  before_action :authorize_user
  before_action :authorize_admin, :except => [:index, :mark_complete]
  before_action :verify_correct_user, :only => [:index]

  def index
    @tasks = @scope.all
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
      redirect_to tasks_path
    else
      flash[:error] = "Task was not able to be deleted."
      redirect_to tasks_path
    end
  end

  def mark_complete
    st = SponsorTask.where(sponsor: Sponsor.find(params[:sponsor_id]), task: Task.find(params[:id])).first
    st.completed = params[:completed]
    st.save
  end

  def remove_from_sponsor
    task = Task.find params[:id]
    sponsor_task = task.sponsor_tasks.where(sponsor: Sponsor.find(params[:sponsor_id]), task: task).first

    if sponsor_task && sponsor_task.destroy
      flash[:success] = "Task was successfully removed."
      redirect_to sponsor_tasks_path(params[:sponsor_id])
    else
      flash[:error] = "Task was not removed."
      redirect_to sponsor_tasks_path(params[:sponsor_id])
    end
  end

  def add_to_sponsor
    task = Task.find params[:task]
    sponsor = Sponsor.find params[:sponsor_id]

    sponsor.tasks << task
    redirect_to sponsor_tasks_path(params[:sponsor_id])
  end

  private
  def create_params
    params.require(:task).permit(:name, :description, :related_url)
  end

  def update_params
    create_params
  end

  def determine_scope
    @scope = Task

    if params[:sponsor_id]
      @scope = Sponsor.find(params[:sponsor_id]).tasks
    end
  end

  def verify_correct_user
    if params[:id]
      sponsor = Sponsor.find params[:id]

      unless current_user.admin? || sponsor.contacts.include?(current_user)
        flash[:error] = "You are not authorized to view this page."
        redirect_to root_path
      end
    end
  end
end
