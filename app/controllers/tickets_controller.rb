class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[notice] = 'Ticket has been created.'
      redirect_to tickets_path
    else
      flash.now[alert] = 'Ticket has not been created.'
      render 'new'
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :seat_id_seq, :address, :price_paid, :email_address)
  end
end
