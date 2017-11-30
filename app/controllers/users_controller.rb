class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @events = @user.events
    @bookings = @user.bookings
    @event = Event.find(params[:event_id]) if !params[:event_id].nil?
    @reviews = @user.reviews
    @pending_reviews = pending_reviews(@user)
    authorize @user
    @users = User.where.not(latitude: nil, longitude: nil)

    #needed for creating review
    @review = Review.new

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def edit
    authorize @user
  end

  def update
    @user.status = params[:user][:status] == "1"
    @user.update(user_params)
    redirect_to user_path(@user)
    authorize @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :phone_number, :photo, :location)
  end

  def pending_reviews(user) # return past bookings, accepted without reviews
    pending_reviews = []
    @past_events = @user.events.select { |event| event.date < Time.now }
    @past_events.each do |event|
      event.bookings.each { |booking| pending_reviews << booking if booking.status == "accepted" && booking.review.nil? }
    end
    return pending_reviews
  end

end
