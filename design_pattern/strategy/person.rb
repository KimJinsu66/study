# frozen_string_literal: true

class Person
  attr_accessor :number1, :number2, :calculator

  def initialize(number1, number2, calculator)
    @number1 = number1
    @number2 = number2
    @calculator = calculator
  end

  def calculate
    calculator.execute(number1, number2)
  end

  def change_calculator(params_calculator)
    @calculator = params_calculator
  end

  def change_number(params_number1, params_number2)
    @number1 = params_number1
    @number2 = params_number2
  end
end
