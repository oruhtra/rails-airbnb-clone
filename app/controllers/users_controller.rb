class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @events = @user.events
    @bookings = @user.bookings
    @reviews = @user.reviews
    @pending_reviews = @user.pending_reviews
    authorize @user
    @users = User.where.not(latitude: nil, longitude: nil)
    #needed for creating review
    @review = Review.new

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

end
