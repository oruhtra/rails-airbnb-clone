class PagesController < ApplicationController
  skip_before_action  :authenticate_user!, only: :home
  def home
    if current_user.nil?
      @pleureurs = User.where(status: true)
    else
      @pleureurs = User.where("status = ? AND id != ?", true, current_user.id)
    end
  end

end
