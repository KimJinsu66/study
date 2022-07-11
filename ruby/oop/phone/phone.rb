# frozen_string_literal: true

require './abstract_phone'

# Description/Explanation of Phone class
class Phone < AbstractPhone
  def initialize(amount, seconds)
    @amount = amount
    @seconds = seconds
    @calls = []
  end

  def calculate_fee
    result = 0

    @calls.each do |call|
      result += 1 # 修正する必要がある
    end

    result
  end
end
