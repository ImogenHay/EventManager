class ResourcesController < ApplicationController
  def resources
    @locations = Location.ordered
    @events = Event.ordered.indate
  end
end
