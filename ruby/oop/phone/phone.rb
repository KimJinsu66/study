# frozen_string_literal: true

require './abstract_phone'

# Description/Explanation of Phone class
class Phone < AbstractPhone
  def initialize(amount, seconds)
    @amount = amount
    @seconds = seconds
  end

  def calculate_call_fee; end
end
