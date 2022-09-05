class PagesController < ApplicationController
  def home
  end

  def dashboard
    @tontines = Tontine.where(user_id: current_user)
    @members = Member.where(user_id: current_user, status: "pending")
  end
end
