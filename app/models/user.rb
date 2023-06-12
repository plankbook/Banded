class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
  # multisearchable against: [:location, :instrument]
  pg_search_scope :search_by_location_and_user_instrument,
  against: [ :location ],
  associated_against: {
    instruments: [ :name ]
   },
  using: {
    tsearch: { prefix: true }
  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :connections_as_requester, class_name: "User", foreign_key: :requester_id
  has_many :connections_as_receiver, class_name: "User", foreign_key: :receiver_id
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :posts
  accepts_nested_attributes_for :user_instruments, reject_if: :all_blank, allow_destroy: true
  has_one_attached :photo
  has_many_attached :media

  has_many :notifications, as: :recipient, dependent: :destroy
end
