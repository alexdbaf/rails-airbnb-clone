class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :meeting_room, foreign_key: true
      t.references :user, foreign_key: true
      t.time :begin_time
      t.time :end_time
      t.float :full_price

      t.timestamps
    end
  end
end
