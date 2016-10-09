class SponsorsController < ApplicationController
  before_action :authorize_user
  before_action :authorize_admin, :only => [:index, :new, :create, :destroy]
  before_action :verify_correct_user, :only => [:show, :edit, :update]

  def index
    @sponsors = Sponsor.all
  end

  def show
    @sponsor = Sponsor.find(params[:id])
    @pledges = @sponsor.pledges.first
  end

  def new
    @sponsor = Sponsor.new
    @sponsor.pledges.build
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)

    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to @sponsor, notice: 'Sponsor was successfully created.' }
        format.json { render json: @sponsor, status: :created, location: @sponsor }
      else
        render :new
      end
    end

  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def update
    @sponsor = Sponsor.find(params[:id])

    if @sponsor.update_attributes(sponsor_params)
      flash[:success] = "Sponsor successfully updated."
      render :show
    else
      flash[:error] = "Unable to update sponsor."
      render :edit
    end
  end

  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy

    respond_to do |format|
      format.html { redirect_to sponsors_url }
      format.json { head :no_content }
    end
  end

  def filter
    @sponsors = Sponsor.all

    puts params[:level].empty?
    puts params[:active].empty?
    puts params[:task].empty?

    unless params[:level].empty?
      @sponsors = @sponsors.select do |s|
        if !s.pledges.first.nil? && !params[:level].empty?
          s.pledges.first.level == params[:level]
        else
          false
        end
      end
    end

    unless params[:active].empty?
      @sponsors = @sponsors.select { |s| s.active?.to_s == params[:active] }
    end

    unless params[:task].empty?
      @sponsors = @sponsors.select { |s| !s.sponsor_tasks.where(completed: false, task: params[:task]).first.nil? }
    end

    render :index
  end

  private
  def sponsor_params
    params.require(:sponsor).permit(:name, :logo, :active, :inactive_reason, :fiscal_year_start_month, :notes, :pledges, :primary_assignee, :secondary_assignee, {pledges_attributes: [ :id, :level, :amount_pledged, :amount_paid, :inkind_pledged, :inkind_received, :_destroy] })
  end

  def verify_correct_user
    sponsor = Sponsor.find params[:id]

    unless current_user.admin? || sponsor.contacts.include?(current_user)
      flash[:error] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
end
