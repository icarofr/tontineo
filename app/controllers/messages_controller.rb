class MessagesController < ApplicationController
  def create
	@tontine = Tontine.find(params[:tontine_id])
	@message = Message.new(message_params)
	@message.tontine = tontine
	@message.user = current_user
	if message.save
	  redirect_to tontine_path(@tontine)
	else
	  render "tontines/show", status: :unprocessable_entity
	end
  end

  private

  def message_params
  	params.require(:message).permit(:body)
  end
end
