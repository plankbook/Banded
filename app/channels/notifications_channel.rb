class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # stream_from "notifications_#{current_user.id}"
    current_user = User.find(params[:id])
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
