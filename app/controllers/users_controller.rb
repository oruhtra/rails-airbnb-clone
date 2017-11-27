class UsersController < ApplicationController

  before_action :set_user

  def show
    @events = @user.events
    @bookings = @user.bookings
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :status, :phone_number)
  end
end
