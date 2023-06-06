class Post < ApplicationRecord
  belongs_to :project
  belongs_to :sender, class_name: "User"
  has_many :comments, -> { order "created_at DESC" }
end
