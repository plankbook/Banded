class Connection < ApplicationRecord
  belongs_to :requester, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :messages

  has_noticed_notifications model_name: "Notification"
  has_many :notifications, through: :user, dependent: :destroy
end
