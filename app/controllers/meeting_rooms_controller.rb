class MeetingRoomsController < ApplicationController

  def index
   @meeting_rooms = MeetingRoom.all
  end

  def show
    @meeting_room = MeetingRoom.find(params[:id])
  end

  def new
    @meeting_room = MeetingRoom.new
  end

  def create
    @meeting_room = MeetingRoom.create(meeting_room_params)
    redirect_to meeting_room_path(@meeting_room)
  end

  def destroy
    @meeting_room = MeetingRoom.find(params[:id])
    @meeting_room.destroy
    redirect_to meeting_rooms_path
  end

  private

  def meeting_room_params
    params.require(:meeting_rooms).permit(:hourly_price, :n_people, :user_id, :closing_hour, :opening_hour, :saturday_open, :sunday_open, :location, :layout, :description, :adress)
end

end
