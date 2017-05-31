class AddCoordinatesToMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :meeting_rooms, :latitude, :float
    add_column :meeting_rooms, :longitude, :float
  end
end
