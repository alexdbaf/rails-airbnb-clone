class BookingsController < ApplicationController


  def index
    @bookings = Booking.where(user: current_user.id)
  end

  def new
    @booking = Booking.new
  end

  def create
    set_meeting_room
    @booking = Booking.new(booking_params)
    @booking.meeting_room = @meeting_room
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end

  end

  def show
     @booking = Booking.find(params[:id])
  end

  private

  def set_meeting_room
    @meeting_room = MeetingRoom.find(params[:meeting_room_id])
  end

  def booking_params
    params.require(:booking).permit(:id, :user_id, :meeting_room_id, :full_price, :morning, :afternoon, :day)
  end

end
