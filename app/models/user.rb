class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :connexions_as_user1, class_name: "User", foreign_key: :user1_id
    has_many :connexions_as_user2, class_name: "User", foreign_key: :user2_id
end
