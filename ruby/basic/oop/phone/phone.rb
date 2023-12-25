# frozen_string_literal: true

require './rate_policy'

# Description/Explanation of Phone class
class Phone
  def initialize(start_time, end_time, calls)
    @start_time = start_time
    @end_time = end_time
    @calls = []
  end

  def calculate_fee
    p "====================================="
    p "calculate fee start "
    p "====================================="

    RatePolicy.new.calculate_fee(self)
  end

  def test_call
    p "phone desu"
  end
end

Phone.new("start_time", "end_time", [1, 3, 5]).calculate_fee
