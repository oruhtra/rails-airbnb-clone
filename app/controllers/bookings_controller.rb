class BookingsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.status = "pending"
    @booking.price = @user.tarif
    @booking.save
    redirect_to booking_messages_path(@booking)
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.permit(:event_id, :user_id, :status)
  end

end
