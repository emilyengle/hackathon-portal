class PerksController < ApplicationController
  before_action :determine_scope, :only => [:index]
  before_action :authorize_user
  before_action :authorize_admin, :except => [:index]
  before_action :verify_correct_user, :only => [:index]

  def index
    @perks = @scope.all
  end

  def new
    @perk = Perk.new
  end

  def create
    @perk = Perk.new create_params

    if @perk.save
      flash[:success] = "Perk was successfully created."
      redirect_to perks_path
    else
      flash[:error] = "Perk was not created."
      render :new
    end
  end

  def edit
    @perk = Perk.find params[:id]
  end

  def update
    @perk = Perk.find params[:id]

    if @perk.update_attributes update_params
      flash[:success] = "Perk was successfully updated."
      redirect_to perks_path
    else
      flash[:error] = "Perk was not updated."
      render :edit
    end
  end

  def destroy
    perk = Perk.find params[:id]

    if perk.destroy
      flash[:success] = "Perk was successfully destroyed."
      redirect_to perks_path
    else
      flash[:error] = "Perk was not destroyed."
      redirect_to perks_path
    end
  end

  def remove_from_sponsor
    perk = Perk.find params[:id]
    perk_pledge = perk.perk_pledges.where(pledge: Sponsor.find(params[:sponsor_id]).pledges.first).first

    if perk_pledge && perk_pledge.destroy
      flash[:success] = "Perk was successfully removed."
      redirect_to sponsor_perks_path(params[:sponsor_id])
    else
      flash[:error] = "Perk was not removed."
      redirect_to sponsor_perks_path(params[:sponsor_id])
    end
  end

  def add_to_sponsor
    perk = Perk.find params[:perk]
    sponsor = Sponsor.find params[:sponsor_id]
    pledge = sponsor.pledges.first

    pledge.perks << perk
    redirect_to sponsor_perks_path(params[:sponsor_id])
  end

  private
  def create_params
    params.require(:perk).permit(:name, :description, :level)
  end

  def update_params
    create_params
  end

  def determine_scope
    @scope = Perk

    if params[:sponsor_id]
      pledge = Sponsor.find(params[:sponsor_id]).pledges.first

      if pledge.nil?
        @scope = Perk.none
      else
        @scope = pledge.perks
      end
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
