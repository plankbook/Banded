class AddBioToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :bio, :string
  end
end
