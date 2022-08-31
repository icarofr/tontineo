class PagesController < ApplicationController
  def home
  end

  def dashboard
    @tontines = Tontine.where(user_id: current_user)
  end
end
