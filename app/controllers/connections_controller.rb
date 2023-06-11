class ConnectionsController < ApplicationController
  def index
    @connections_requested = Connection.where(requester: current_user, status: "pending")
    @connections_received = Connection.where(receiver: current_user, status: "pending")
    @my_connections = Connection.where('(requester_id = ? or receiver_id = ?) and status = ?', current_user, current_user, 'accepted')
  end

  def create
    @user = User.find(params[:user_id])
    @connection = Connection.create(requester: current_user, receiver: @user)

    # to pick up for AJAX submit connect requests
    # respond_to do |format|
    #   format.html
    #   format.json(message: "OK")
    # end
  end

  def accept
    @connection = Connection.find(params[:id])
    @connection.update(status: "accepted")
    notify_requester
  end

  def reject
    @connection = Connection.find(params[:id])
    @connection.update(status: "rejected")
    notify_requester
  end

  def show
    @connection = Connection.find(params[:id])
    @message = Message.new
  end

  private

  def notify_requester
    ConnectionNotification.with(connection: @connection).deliver_later(@connection.requester)
  end
end
