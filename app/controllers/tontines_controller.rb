class TontinesController < ApplicationController
  before_action :set_tontine, only: %i[edit show destroy update]

  def index
    @tontines = Tontine.all
  end

  def show
    @is_owner = @tontine.user.id == current_user.id
  end

  def new
    @tontine = Tontine.new
  end

  def create
    @tontine = Tontine.new(params_tontine)
    @tontine.user = current_user
    @tontine.status = "pending"

    if @tontine.save!
      redirect_to list_users_from_company_tontine_path(@tontine)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @tontine.update(params_tontine)
    redirect_to tontine_path(@tontine)
  end

  def destroy
    @tontine.update(params_tontine)
    redirect_to tontines_path, status: :see_other
  end

  def list_users_from_company
    @tontine = Tontine.find(params[:id])
    @users_to_add = User.where(company: current_user.company)
  end

  def add_users_to_tontine
    @tontine = Tontine.find(params[:id])
    @users_to_add = User.where(company: current_user.company)

    @users_to_add.each_with_index do |user, index|
      member = Member.new(
        user: user,
        tontine: @tontine,
        position: index + 1,
        status: "pending"
      )
      member.status = "accepted" if user.id == current_user.id
      member.save!
    end

    redirect_to tontine_path(@tontine)
  end

  def accepte_member
    @tontine = Tontine.find(params[:id])
    current_user.members.where(tontine: @tontine).first.update(status: "accepted")
    redirect_to tontine_path(@tontine)
  end

  def decline_member
    @tontine = Tontine.find(params[:id])
    current_user.members.where(tontine: @tontine).first.update(status: "declined")
    redirect_to dashboard_path
  end

  private

  def set_tontine
    @tontine = Tontine.find(params[:id])
  end

  def params_tontine
    params.require(:tontine).permit(:name, :contribution, :start_month, :payment_day, :participants, :cover)
  end
end
