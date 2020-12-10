class ResourcesController < ApplicationController
  def resources
    @locations = Location.all
    @events = Event.all
  end
end
