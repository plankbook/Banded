class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :sender, class_name: "User"
end
