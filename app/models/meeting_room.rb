class MeetingRoom < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  validates :name, :n_people, :hourly_price, :description, presence: true
  validates :hourly_price, :n_people, numericality: true
  validates :name, :description, :address, length: { maximum: 100 }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  mount_uploader :photo, PhotoUploader


end
