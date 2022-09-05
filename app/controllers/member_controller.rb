class MemberController < ApplicationController
  def status
    redirect_to dashboard_path(@dashboard.current_user), status: :see_other
  end
end
