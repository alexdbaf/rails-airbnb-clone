class MeetingRoomsController < ApplicationController

  def index
   @meeting_rooms = MeetingRoom.all

  end


  def show
    @meeting_room = MeetingRoom.find(params[:id])
    @hash = [{ lat: @meeting_room.latitude, lng: @meeting_room.longitude }]
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
    @meeting_room.destroy
    redirect_to meeting_rooms_path
  end

  private

  def meeting_room_params
    params.require(:meeting_room).permit(:id, :hourly_price, :n_people, :user_id, :morning, :afternoon, :saturday_open, :sunday_open, :location, :layout, :description, :address, :name, :photo, :photo_cache)
  end

end
