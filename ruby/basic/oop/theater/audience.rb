# frozen_string_literal: true

require './bag'

# Description/Explanation of Audience class
class Audience
  def buy(ticket)
    bag.setTicket(ticket)
  end
end
