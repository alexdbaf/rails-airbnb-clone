class MeetingRoom < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  validates :name, :n_people, :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
