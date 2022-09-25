# frozen_string_literal: true

require './calculator'

class PlusCalculator < Calculator
  def execute(number1, number2)
    number1 + number2
  end
end
