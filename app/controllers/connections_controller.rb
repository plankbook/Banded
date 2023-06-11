class ConnectionsController < ApplicationController
  def index
    @connections_requested = Connection.where(requester: current_user, status: "pending")
    @connections_received = Connection.where(receiver: current_user, status: "pending")
    @my_connections = Connection.where('(requester_id = ? or receiver_id = ?) and status = ?', current_user, current_user, 'accepted')
    Notification.all.each do |notification|
      notification.update(read_at: Time.now) if notification.params[:connection].requester == current_user
    end
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
    broadcast_notifications
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

  def broadcast_notifications
    NotificationsChannel.broadcast_to(
      @connection.requester,
      notification: render_notifications,
      unread_count: Notification.unread.count,
      receiver_id: @connection.receiver.id
    )
    head :ok
  end

  def render_notifications
    render_to_string(partial: 'layouts/notification', locals: { notification: Notification.last } )
  end
end
