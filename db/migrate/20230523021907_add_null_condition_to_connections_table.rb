class AddNullConditionToConnectionsTable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :connections, :requester_id, false
    change_column_null :connections, :receiver_id, false
  end
end
