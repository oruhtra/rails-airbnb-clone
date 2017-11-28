class PagesController < ApplicationController
  def home
    @pleureurs = User.where(status: true)
  end

end
