class TontinesController < ApplicationController
  before_action :set_tontine, only: %i[edit show destroy update]

  def index
    @tontines = Member.where(user_id: current_user.id).map(&:tontine)
  end

  def show
  end

  def new
    @tontine = Tontine.new
  end

  def add_members
    @tontine = Tontine.find(params[:id])
    @users = User.where(company: current_user.company)
  end

  def add_members_patch
    @tontine = Tontine.find(params[:id])
    # p "+++++++++++++++"
    params.each do |key, value|
      add_member(@tontine, value) if key.include?("member")
    end
    # p "+++++++++++++++"
  end

  def create
    @tontine = Tontine.new(params_tontine)
    @tontine.id = Tontine.maximum(:id).next.to_i
    @tontine.user = current_user
    @tontine.status = "pending"

    if @tontine.save!
      add_member(@tontine, current_user.id)
      redirect_to "/tontines/#{@tontine.id}/add_members"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @is_owner = @tontine.user.id == current_user.id
  end

  def update
    @tontine.update(params_tontine)
    redirect_to tontine_path(@tontine)
  end

  def destroy
    @tontine.update(params_tontine)
    redirect_to tontines_path, status: :see_other
  end

  private

  def set_tontine
    @tontine = Tontine.find(params[:id])
  end

  def params_tontine
    params.require(:tontine).permit(:name, :contribution, :start_month, :payment_day, :participants)
  end

  def add_member(tontine, user_id)
    Member.create(id: Member.maximum(:id).to_i.next, user_id:, tontine_id: tontine.id, position: tontine.members.count + 1,
                  status: "active")

    tontine.save!
  end
end
