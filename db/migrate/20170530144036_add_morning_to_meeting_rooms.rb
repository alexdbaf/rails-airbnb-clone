class AddMorningToMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :meeting_rooms, :morning, :boolean
  end
end
