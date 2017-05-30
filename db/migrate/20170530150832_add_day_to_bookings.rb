class AddDayToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :day, :date
  end
end
