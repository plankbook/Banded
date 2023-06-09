class Project < ApplicationRecord
  has_many :posts, -> { order "created_at DESC" }
  has_many :user_projects
  has_many :users, through: :user_projects
end
