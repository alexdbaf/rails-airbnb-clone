class AddAfternoonToMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :meeting_rooms, :afternoon, :boolean
  end
end
