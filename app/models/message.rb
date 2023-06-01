class Message < ApplicationRecord
  belongs_to :connection
  belongs_to :sender, class_name: "User"

  def sender?(a_user)
    sender.id == a_user.id
  end
end
