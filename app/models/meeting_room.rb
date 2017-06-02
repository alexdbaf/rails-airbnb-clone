class MeetingRoom < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  validates :name, :n_people, :hourly_price, :description, presence: true
  validates :hourly_price, numericality: { greater_than: 0, less_than: 200 }
  validates :n_people, numericality: { only_integer: true, greater_than: 0, less_than: 100 }
  validates :name, :description, :address, length: { maximum: 100 }
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  mount_uploader :photo, PhotoUploader


end
