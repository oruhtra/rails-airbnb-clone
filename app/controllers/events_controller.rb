class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    @users = User.where(status: true)
    @booking = Booking.new
    @bookings = @event.bookings
  end

  def new
    @event = Event.new
  end

  def create
    @pleureurs = User.where(status: true)
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @user = @event.user
    @event.destroy
    redirect_to user_path(@user)
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date)
  end

end
