# To deliver this notification:
#
# ConnectionNotification.with(post: @post).deliver_later(current_user)
# ConnectionNotification.with(post: @post).deliver(current_user)

class ConnectionNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @receiver = User.find(params[:connection][:receiver_id])
    "#{@receiver.name} accepted your connection request"
  end

  def url
    artist_path(params[:connection][:receiver_id])
  end
end
