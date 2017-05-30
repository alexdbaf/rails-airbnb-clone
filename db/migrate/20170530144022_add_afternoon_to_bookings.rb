class AddAfternoonToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :afternoon, :boolean
  end
end
