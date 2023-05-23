class ChangeColumnNamesInConnectionsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :connections, :user1_id, :requester_id
    rename_column :connections, :user2_id, :receiver_id
  end
end
