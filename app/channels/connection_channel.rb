class ConnectionChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    connection = Connection.find(params[:id])
    stream_for connection
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  end
end
