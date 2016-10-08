class UsersController < ApplicationController
  before_action :authorize_user, :except => [:new, :create]
  before_action :authorize_admin, :only => [:index, :destroy]
  before_action :verify_correct_user, :only => [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_username params[:id]
    not_found if @user.nil?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new create_params

    if @user.save
      flash[:success] = "User successfully created."
      render :show
    else
      flash[:error] = "User was not successfully created."
      render :new
    end
  end

  def edit
    @user = User.find_by_username params[:id]
    not_found if @user.nil?
  end

  def update
    @user = User.find_by_username params[:id]
    not_found if @user.nil?

    if @user.update_attributes update_params
      flash[:success] = "User successfully updated."
      render :show
    else
      flash[:error] = "Unable to update user."
      render :edit
    end
  end

  def destroy
    @user = User.find_by_username params[:id]
    not_found if @user.nil?

    if @user.destroy
      flash[:success] = "User successfully destroyed."
      redirect_to root_path
    else
      flash[:error] = "User was not successfully destroyed."
      render :show
    end
  end

  private
  def verify_correct_user
    unless current_user.username == params[:id] || current_user.admin?
      flash[:error] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
end
