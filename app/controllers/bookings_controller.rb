class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(booking_params)

  end

  private

  def booking_params
    params.require(:booking).permit(:id, :user_id, :meeting_room_id, :full_price, :morning, :afternoon, :day)
  end

end
