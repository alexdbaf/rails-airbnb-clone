class ReviewsController < ApplicationController

  def index

  end

  def show

  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create

    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to meeting_room_path(@booking.meeting_room)
    else
      render :new
    end
  end

  def destroy

  end



  private

  def review_params
    params.require(:review).permit(:id, :booking_id, :content, :rating)
  end

end
