# frozen_string_literal: true

require './ticket_seller'

# Description/Explanation of Theater class
class Theater
  def enter(audience)
    TicketSeller.set_ticket(audience)
  end
end

Theater.new.enter('audience')
