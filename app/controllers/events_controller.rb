class EventsController < ApplicationController

  def new
    @pleureurs = User.where(status: true)
    @event = Event.new
  end

  def create
    @pleureurs = User.where(status: true)
    @event = Event.new(event_params)
    @event.user = current_user.id
    if @event.save
      redirect_to new_event_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date)
  end

end
