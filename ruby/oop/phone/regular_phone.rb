# frozen_string_literal: true

require './abstract_phone'

# Description/Explanation of RegularPhone class
class RegularPhone < AbstractPhone
  def initialize(amount, seconds)
    super
    @amount = amount
    @seconds = seconds
  end

  def calculate_call_fee(call)
    @amount * (call.duration / @seconds)
  end
end
