class TicketsController < ApplicationController
  def index
    matching_tickets = Ticket.all

    @list_of_tickets = matching_tickets.order({ :created_at => :desc })

    render({ :template => "tickets/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tickets = Ticket.where({ :id => the_id })

    @the_ticket = matching_tickets.at(0)

    render({ :template => "tickets/show.html.erb" })
  end

  def create
    the_ticket = Ticket.new
    the_ticket.customer = @current_user
    the_ticket.vendor_id = params.fetch("query_vendor_id")
    the_ticket.details = params.fetch("query_details")
    the_ticket.photo = params.fetch("query_photo")
    the_ticket.status = params.fetch("query_status")

    if the_ticket.valid?
      the_ticket.save
      redirect_to("/dashboard", { :notice => "Ticket created successfully." })
    else
      redirect_to("/tickets", { :alert => the_ticket.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_ticket = Ticket.where({ :id => the_id }).at(0)

    the_ticket.customer_id = params.fetch("query_customer_id")
    the_ticket.vendor_id = params.fetch("query_vendor_id")
    the_ticket.details = params.fetch("query_details")
    the_ticket.photo = params.fetch("query_photo")
    the_ticket.status = params.fetch("query_status")

    if the_ticket.valid?
      the_ticket.save
      redirect_to("/tickets/#{the_ticket.id}", { :notice => "Ticket updated successfully." })
    else
      redirect_to("/tickets/#{the_ticket.id}", { :alert => the_ticket.errors.full_messages.to_sentence })
    end
  end

  def dashboard
    @list_of_tickets = Ticket.order(created_at: :desc)

    redirect_to("/dashboard.html.erb", { :notice => "Ticket deleted successfully." })
  end

  def destroy
    the_id = params.fetch("path_id")
    the_ticket = Ticket.where({ :id => the_id }).at(0)

    the_ticket.destroy

    redirect_to("/tickets", { :notice => "Ticket deleted successfully." })
  end
end
