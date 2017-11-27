class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    @pleureurs = User.where(status: true)
    @bookings = @event.bookings
  end

  def new
    @pleureurs = User.where(status: true)
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

  private

  def event_params
    params.require(:event).permit(:title, :location, :date)
  end

end
