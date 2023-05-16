class DashboardController < ApplicationController
  def index
    @list_of_tickets = []
    render({ :template => "dashboard/index.html.erb" })
  end
end
