class AddMorningToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :morning, :boolean
  end
end
