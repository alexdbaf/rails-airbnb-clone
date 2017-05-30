class RemoveBeginTimeFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :begin_time, :time
  end
end
