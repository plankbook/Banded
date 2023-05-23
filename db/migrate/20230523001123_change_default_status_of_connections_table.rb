class ChangeDefaultStatusOfConnectionsTable < ActiveRecord::Migration[7.0]
  def change
    change_column_default :connections, :status, "pending"
  end
end
