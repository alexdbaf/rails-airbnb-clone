class AddNameToMeetingRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :meeting_rooms, :name, :string
  end
end
