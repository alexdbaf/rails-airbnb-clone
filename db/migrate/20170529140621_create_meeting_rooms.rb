class CreateMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_rooms do |t|
      t.float :hourly_price
      t.integer :n_people
      t.references :user, foreign_key: true
      t.time :closing_hour
      t.time :opening_hour
      t.boolean :saturday_open
      t.boolean :sunday_open
      t.string :location
      t.string :layout
      t.string :description
      t.string :address

      t.timestamps
    end
  end
end
