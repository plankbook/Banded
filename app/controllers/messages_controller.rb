class MessagesController < ApplicationController
  def create
    @connection = Connection.find(params[:connection_id])
    @message = Message.new(message_params)
    @message.connection = @connection
    @message.sender = current_user
    if @message.save
      ConnectionChannel.broadcast_to(
        @connection,
        render_to_string(partial: "message", locals: { message: @message })
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
