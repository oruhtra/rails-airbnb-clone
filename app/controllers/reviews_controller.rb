class ReviewsController < ApplicationController


def create
  @review = Review.new(review_params)
  @review.booking = Booking.find(params[:booking_id])
  @user = @review.booking.event.user
  authorize @review
  if @review.save
    redirect_to user_path(@user)
  else
    render :new   # ou bien   render "restaurants/show" # attention , il faut bien renvoyer @review
  end
end

private

def review_params
   params.require(:review).permit(:content, :rating)
end

end
