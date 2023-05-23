class ConnectionsController < ApplicationController
  def index
    @connections_requested = Connection.where(requester: current_user)
    @connections_received = Connection.where(receiver: current_user)
  end

  def create
    @user = User.find(params[:user_id])
    @connection = Conneciton.create(requester: current_user, receiver: @user)
  end

  def update
    @connection = Connection.find(params[:id])
    # @connection.update()?
  end
end
