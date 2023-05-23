class ChangeStatusNullInConnectionsTable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :connections, :status, false
  end
end
