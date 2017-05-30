class PagesController < ApplicationController
  def home
    @meeting_room = MeetingRoom.new

  end
end
