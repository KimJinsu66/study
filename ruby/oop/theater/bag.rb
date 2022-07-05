# frozen_string_literal: true

require './bag'

# Description/Explanation of Bag class
class Bag
  def initilize(invitation, ticket, amount)
    @invitation = invitation
    @ticket = ticket
    @amount = amount
  end

  def set_ticket(ticket)
    if invitation?
      @ticket = ticket
    else
      @ticker = ticket
      minus_amount(ticket.get_fee)
      return ticket.get_fee
    end

    bag.setTicket(ticket)
  end

  private

  def invitation?
    @invitation != nil
  end

  def minus_amount(amount)
    @amount -= amount
  end
end
