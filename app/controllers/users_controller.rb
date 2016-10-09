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
      session[:user_id] = @user.id
      render :show
    else
      flash[:error] = "User was not successfully created."
      puts @user.errors[:phone_number]
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

  def make_admin
    user = User.find_by_username params[:id]
    not_found if user.nil?

    user.user_type = User.user_types[:admin]

    if user.save(:validate => false)
      flash[:success] = "User was made an admin."
      redirect_to users_path
    else
      flash[:error] = "User not able to be made an admin."
      redirect_to users_path
    end
  end

  private
  def create_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :username,
      :password,
      :password_confirmation,
      :phone_number
    )
  end

  def update_params
    if current_user.admin?
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :username,
        :password,
        :password_confirmation,
        :phone_number,
        :user_type
      )
    else
      create_params
    end
  end

  def verify_correct_user
    unless current_user.username == params[:id] || current_user.admin?
      flash[:error] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
end
