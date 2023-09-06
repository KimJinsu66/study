# frozen_string_literal: true

require './abstract_phone'

# Description/Explanation of NightlyDiscountPhone class
class NightlyDiscountPhone < AbstractPhone

  def calculate_call_fee(call)
    @amount * (call.duration / @seconds)
  end
end
