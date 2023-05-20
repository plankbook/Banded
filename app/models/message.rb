class Message < ApplicationRecord
  has_one :connexion
  has_one :user
end
