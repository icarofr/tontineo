class MessagesController < ApplicationController
  def create
	@tontine = Tontine.find(params[:tontine_id])
	@message = Message.new(message_params)
	@message.tontine = @tontine
	@message.user = current_user
	if @message.save
	  TontineChannel.broadcast_to(
	    @tontine,
	    message: render_to_string(partial: "messages/message", locals: { message: @message }),
      author_id: current_user.id
	  )
    head :ok
		else
		  render "tontines/chatroom", status: :unprocessable_entity
		end
  end

  private

  def message_params
  	params.require(:message).permit(:body)
  end
end
