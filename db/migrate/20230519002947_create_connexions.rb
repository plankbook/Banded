class CreateConnexions < ActiveRecord::Migration[7.0]
  def change
    create_table :connexions do |t|
      t.references :user1, foreign_key: { to_table: :users }
      t.references :user2, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
