class MeetingRoomsController < ApplicationController

  def index
   @meeting_rooms = MeetingRoom.all
  end

  def search
    case params[:duration]
    when "1"
      @s_morning = true
      @s_evening = false
    when "2"
      @s_morning = false
      @s_afternoon = true
    when "3"
      @s_morning = true
      @s_afternoon = true
    else
      @s_morning = false
      @s_evening = false
    end
    @meeting_rooms = MeetingRoom.where("n_people >= ? AND morning = ? AND afternoon = ?", params[:n_people], @s_morning, @s_evening)

  end

  def show
    @meeting_room = MeetingRoom.find(params[:id])
    # @hash = [{ lat: @meeting_room.latitude, lng: @meeting_room.longitude }]
  end

  def new
    @meeting_room = MeetingRoom.new
  end

  def create
    @meeting_room = MeetingRoom.create(meeting_room_params)
    if @meeting_room.save
      redirect_to meeting_room_path(@meeting_room)
    else
      render :new
    end
  end

  def destroy
    @meeting_room = MeetingRoom.find(params[:id])
    if !user_signed_in?
      flash[:alert] = "You can't destroy a meeting room that's not yours"
      redirect_to meeting_room_path(@meeting_room)
    elsif !@meeting_room.bookings.empty?
      flash[:alert] = "You can't destroy a meeting room that has pending bookings"
      redirect_to meeting_room_path(@meeting_room)
    elsif current_user == @meeting_room.user
      @meeting_room.destroy
      redirect_to meeting_rooms_path
      flash[:notice] = "Meeting room has been destroyed"
    else
      flash[:alert] = "You can't destroy a meeting room that's not yours"
      redirect_to meeting_room_path(@meeting_room)
    end

  end

  private

  def meeting_room_params
    params.require(:meeting_room).permit(:id, :hourly_price, :n_people, :user_id, :morning, :afternoon, :saturday_open, :sunday_open, :location, :layout, :description, :address, :name, :photo, :photo_cache)
  end

end
