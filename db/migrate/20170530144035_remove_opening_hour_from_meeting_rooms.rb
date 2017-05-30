class RemoveOpeningHourFromMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :meeting_rooms, :opening_hour, :time
  end
end
