class BookingsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @booking = Booking.create(booking_params)
    @booking.update(status: "pending", price: @user.tarif)
    redirect_to event_path(@event)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.permit(:event_id, :user_id, :status, :description)
  end

end
