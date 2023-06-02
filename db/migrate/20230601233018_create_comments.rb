class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :post, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
