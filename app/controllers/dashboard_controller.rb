class DashboardController < ApplicationController
  def index
    matching_tickets = Ticket.all
    @list_of_tickets = matching_tickets.order(created_at: :desc)

    matching_messages = Message.all
    @list_of_messages = matching_messages.order(created_at: :desc)

    render({ :template => "dashboard/index.html.erb"})
  end
end
