class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  
  def home
  end

  def dashboard
    @tontines = current_user.tontines
    @pending_member = current_user.members.where(status: "pending")
    @pending_tontines = @tontines.where(status: "pending")
    @active_tontines = @tontines.where(status: "active")
  end

  def profile
    params[:id] == "me" ? @user = current_user : @user = User.find(params[:id])
  end
end
