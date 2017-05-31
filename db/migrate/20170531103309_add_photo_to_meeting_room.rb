class AddPhotoToMeetingRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :meeting_rooms, :photo, :string
  end
end
