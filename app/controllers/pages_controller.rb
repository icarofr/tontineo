class PagesController < ApplicationController
  def home
  end

  def dashboard
    @tontines = Tontine.where(user_id: current_user)
    @pending_member = current_user.members.where(status: "pending")
  end
end
