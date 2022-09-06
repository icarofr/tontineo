class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  
  def home
  end

  def dashboard
    @tontines = Tontine.where(user_id: current_user)
    @pending_member = current_user.members.where(status: "pending")
  end

  def profile
    params[:id] == "me" ? @user = current_user : @user = User.find(params[:id])
  end
end
