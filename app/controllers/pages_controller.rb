class PagesController < ApplicationController
  skip_before_action  :authenticate_user!, only: :home
  def home
    @pleureurs = User.where(status: true)
  end

end
