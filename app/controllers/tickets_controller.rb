class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new, :create]
  before_action :authenticate_user! #need to be logged in to book tickets
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.user_tickets(current_user).ordered #scope uses devise current user object to restrict search
  end


  # GET /tickets/new
  def new
    @ticket = @event.tickets.new #sets event of ticket
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = @event.tickets.new(ticket_params) #new ticket with only trusted parameters
    @ticket.user = current_user #set user to current user logged in

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format| #uses AJAX for live updates when review destroyed
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.js { flash[:notice] = 'Ticket was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:event_id, :first_name, :last_name, :age)
    end

    #sets event to event of ticket
    def set_event
      @event = Event.find_by(id: params[:event_id]) || Event.find(ticket_params[:event_id])
    end

end
