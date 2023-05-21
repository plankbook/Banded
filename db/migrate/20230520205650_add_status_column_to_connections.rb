class AddStatusColumnToConnections < ActiveRecord::Migration[7.0]
  def change
    add_column :connections, :status, :string
  end
end
