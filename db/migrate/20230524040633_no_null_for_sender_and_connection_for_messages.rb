class NoNullForSenderAndConnectionForMessages < ActiveRecord::Migration[7.0]
  def change
    change_column_null :messages, :connection_id, false
    change_column_null :messages, :sender_id, false
    change_column_null :messages, :content, false
  end
end
