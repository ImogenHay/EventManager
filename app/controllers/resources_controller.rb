class ResourcesController < ApplicationController
  def resources
    @locations = Location.order('name asc')
    @events = Event.order('date asc')
  end
end
