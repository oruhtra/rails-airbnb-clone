class MessagesController < ApplicationController
  def index
    @booking = Booking.find(params[:booking_id])
    @user = current_user
    @messages = policy_scope(Message).order(created_at: :desc).where(booking: @booking)
    @message = Message.new
    @bookings = []
    @user.bookings.each do |b|
      @bookings << b
    end
    @user.events.each do |e|
      e.bookings.each do |b|
        @bookings << b
      end
    end
  end

  def create
    @message = Message.new(message_params)
    @booking = Booking.find(params[:booking_id])
    @user = current_user
    @message.booking = @booking
    @message.user = @user
    authorize @message
    @message.save
    redirect_to booking_messages_path(@booking)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
