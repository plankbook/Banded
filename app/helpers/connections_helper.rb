module ConnectionsHelper
  def my_connections
    Connection.where('(requester_id = ? or receiver_id = ?) and status = ?', current_user, current_user, 'accepted')
  end

  def connections_requested
    Connection.where(requester: current_user, status: "pending")
  end

  def connections_received
    Connection.where(receiver: current_user, status: "pending")
  end
end
