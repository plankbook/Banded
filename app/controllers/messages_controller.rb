class MessagesController < ApplicationController
  def create
    @connection = Connection.find(params[:connection_id])
    @message = Message.new(message_params)
    @message.connection = @connection
    @message.sender = current_user
    if @message.save
      ConnectionChannel.broadcast_to(
        @connection,
        message: render_to_string(partial: "message", locals: { message: @message }),
        sender_id: @message.sender.id
      )
      head :ok
    else
      render "connections/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
