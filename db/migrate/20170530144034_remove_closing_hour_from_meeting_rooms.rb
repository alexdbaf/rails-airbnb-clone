class RemoveClosingHourFromMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    remove_column :meeting_rooms, :closing_hour, :time
  end
end
