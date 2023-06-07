class AddColourToGenres < ActiveRecord::Migration[7.0]
  def change
    add_column :genres, :colour, :string
  end
end
