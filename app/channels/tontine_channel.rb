class TontineChannel < ApplicationCable::Channel
  def subscribed
    tontine = Tontine.find(params[:id])
    stream_for tontine
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
