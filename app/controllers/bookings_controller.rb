class BookingsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @booking = Booking.new
    authorize @event
  end

  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    authorize @event
    @booking = Booking.create(booking_params)
    @booking.update(status: "pending", price: @user.tarif)
    redirect_to event_path(@event)
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
