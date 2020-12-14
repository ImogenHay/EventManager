class ResourcesController < ApplicationController
  def resources #sets location and event using scopes so can be used on resources page
    @locations = Location.ordered
    @events = Event.ordered.indate
  end
end
