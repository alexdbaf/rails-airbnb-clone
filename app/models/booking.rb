class Booking < ApplicationRecord
  belongs_to :meeting_room
  belongs_to :user
  validates :meeting_room_id, :user_id, presence: true
end
