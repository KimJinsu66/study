# frozen_string_literal: true

# Description/Explanation of NightlyDiscountPhone class
class AbstractPhone

  def initialize
    @calls = []
  end

  def calculate_fee
    result = 0

    @calls.each do |call|
      result += calculate_call_fee(call) # 修正する必要がある
    end

    result
  end

  private

  def calculate_call_fee(call)
    raise 'call abstract !'
  end
end
