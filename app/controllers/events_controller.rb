class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_location, only: [:new, :create] #every event has a location
  # GET /events
  # GET /events.json
  def index
    @events = Event.ordered.indate #uses scopes to filter events
  end


  # GET /events/new
  def new
    @event = @location.events.new #sets location of event
  end


  # POST /events
  # POST /events.json
  def create
    @event = @location.events.new(event_params) #new event with only trusted parameters

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format| #uses AJAX for live updates when event destroyed
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.js { flash[:notice] = 'Event was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :location_id, :event_type, :date, :description, :start, :end, :num_tickets, :price)
    end

    #sets location to location of event
    def set_location
      @location = Location.find_by(id: params[:location_id]) || Location.find(event_params[:location_id])
    end
end
