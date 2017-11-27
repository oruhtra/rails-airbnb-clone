class EventsController < ApplicationController

  def new
    @events = Event.all
    @event = Event.new
  end
  def create
  end 
end
