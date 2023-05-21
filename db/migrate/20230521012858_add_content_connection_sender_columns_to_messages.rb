class AddContentConnectionSenderColumnsToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :content, :text
    add_reference :messages, :connection, index: true
    add_reference :messages, :sender, foreign_key: { to_table: :users }, index: true
  end
end
