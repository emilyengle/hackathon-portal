class PledgesController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin :except => [:index]

  def index
    @pledges = Pledge.all
  end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new create_params

    if @pledge.save
      flash[:success] = "Pledge was successfully created."
      render :index 
    else
      flash[:error] = "Pledge was not able to be created."
      render :new
    end
  end

  def edit
    @pledge = Pledge.find params[:id]
  end

  def update
    @pledge = Pledge.find params[:id]

    if @pledge.update_attributes update_params
      flash[:success] = "Pledge updated."
      render :index
    else 
      flash[:error] = "Pledge could not be updated."
      render :edit
    end
  end

  def destroy
    @pledge = Pledge.find params[:id]

    if @pledge.destroy
      flash[:success] = "Pledge deleted."
      render :index
    else 
      flash[:error] = "Pledge was not able to be deleted."
      render :index
    end 
  end

  private 
  def create_params
    params.require(:sponsor).permit(:level, :pledge_type, :amount_pledged, :amount_paid, :inkind_pledged, :inkind_received)
  end
  
  def update_params
    create_params 
  end
end
