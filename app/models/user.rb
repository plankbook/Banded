class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :connexions_as_user1, class_name: "User", foreign_key: :user1_id
  has_many :connexions_as_user2, class_name: "User", foreign_key: :user2_id
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :posts
  accepts_nested_attributes_for :user_instruments, reject_if: :all_blank, allow_destroy: true
  has_one_attached :photo
end
