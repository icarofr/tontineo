class SwapRequestController < ApplicationController
  def create
    @swap_request = SwapRequest.new(swap_request_params)
    @swap_request.sender_id = current_user.id
    if Member.find_by(user_id: @swap_request.receiver_id,
                      tontine_id: @swap_request.tontine_id) && Member.find_by(user_id: @swap_request.sender_id,
                                                                              tontine_id: @swap_request.tontine_id)
      @swap_request.status = "pending"
      @swap_request.save
      return redirect_to swap_request_path(@swap_request)
    end
  end

  def new
    @swap_request = SwapRequest.new
  end

  def show
    @swap_request = SwapRequest.find(params[:id])
  end

  def index
    @swap_requests = SwapRequest.all
  end

  def edit
    @swap_request = SwapRequest.find(params[:id])
  end

  def update
    @swap_request = SwapRequest.find(params[:id])
    if (@swap_request.status == "pending") && (@swap_request.receiver_id == current_user.id)
      accept_swap(@swap_request)
      flash[:notice] = "Swap Request Accepted"
    else
      flash[:notice] = "Unauthorized"
    end
    redirect_to swap_request_path(@swap_request)
  end

  def destroy
    @swap_request = SwapRequest.find(params[:id])
    @swap_request.destroy
    redirect_to swap_requests_path
  end

  private

  def swap_request_params
    params.require(:swap_request).permit(:receiver_id, :tontine_id)
  end

  def accept_swap(swap_request)
    return false if swap_request.nil? || swap_request.status != "pending"

    swap_request.status = "accepted"
    position1 = Member.find_by(user_id: swap_request.sender_id, tontine_id: swap_request.tontine_id).position
    position2 = Member.find_by(user_id: swap_request.receiver_id, tontine_id: swap_request.tontine_id).position
    Member.update(Member.find_by(user_id: swap_request.sender_id, tontine_id: swap_request.tontine_id).id,
                  position: position2)
    Member.update(Member.find_by(user_id: swap_request.receiver_id, tontine_id: swap_request.tontine_id).id,
                  position: position1)
    swap_request.save
  end
end
