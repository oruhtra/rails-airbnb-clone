class PagesController < ApplicationController
  skip_before_action  :authenticate_user!, only: :home
  def home
    !current_user.nil? ? @id = current_user.id : @id = 0
    if params[:query].present?
      @users = User.where(status: true).where.not(id: @id).near(params[:query], 1000)
    else
      @users = User.where("status = ? AND id != ?", true, @id)
    end

    respond_to do |format|
      format.html { render 'home' }
      format.js
    end

  end

end
