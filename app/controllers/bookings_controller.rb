class BookingsController < ApplicationController


  def index
    @bookings = Booking.where(user: current_user.id)
    @bookingsowner = []
    current_user.meeting_rooms.each do |mr|
      mr.bookings.each do |bk|
        @bookingsowner << bk
      end
    end
  end

  def new
    set_meeting_room
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

  def destroy
      @booking = Booking.find(params[:id])
    if !user_signed_in?
      flash[:alert] = "You can't destroy a booking room that's not yours"
      redirect_to booking_path(@booking)
    elsif current_user == @booking.user
      @booking.destroy
      redirect_to bookings_path
      flash[:notice] = "This booking has been destroyed"
    else
      flash[:alert] = "You can't cancel a booking that's not yours"
      redirect_to booking_path(@booking)
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
