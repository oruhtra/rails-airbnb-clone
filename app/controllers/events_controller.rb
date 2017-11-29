class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    @users = User.where("status = ? AND id != ?", true, @event.user_id)
    @booking = Booking.new
    @bookings = @event.bookings
    authorize @event

    @events = Event.where.not(latitude: nil, longitude: nil)

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @pleureurs = User.where(status: true)
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @user = @event.user
    authorize @event
    @event.destroy
    redirect_to user_path(@user)
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date)
  end

end
