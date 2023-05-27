class RemoveColumnAndAddForeignKeysToUserGenres < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_genres, :name, :string

    add_reference :user_genres, :user, foreign_key: true
    add_reference :user_genres, :genre, foreign_key: true
  end
end
