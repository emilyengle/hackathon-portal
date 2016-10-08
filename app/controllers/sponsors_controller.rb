class SponsorsController < ApplicationController
  before_action :authorize_user
  before_action :authorize_admin, :only => [:create, :destroy]
  before_action :verify_correct_user, :only => [:show, :edit, :update]

  def index
    @sponsors = Sponsor.all
  end

  def show
    @sponsor = Sponsor.find(params[:id])
  end

  def new
    @sponsor = Sponsor.new
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

  private

    def sponsor_params
      params.require(:sponsor, :registration_password, :name).permit(:logo, :active, :inactive_reason, :fiscal_year_start_month, :notes)
    end

    def verify_correct_user
      unless current_user.username == params[:id] || current_user.admin?
        flash[:error] = "You are not authorized to view this page."
        redirect_to root_path
      end
    end

end
