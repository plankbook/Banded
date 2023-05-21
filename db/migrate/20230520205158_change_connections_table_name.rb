class ChangeConnectionsTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :connexions, :connections
  end
end
