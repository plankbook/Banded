class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :media_attachment_url
      t.references :project, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
