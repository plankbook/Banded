class RemoveUserColumnFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_reference :projects, :user, foreign_key: true, index: false
  end
end
