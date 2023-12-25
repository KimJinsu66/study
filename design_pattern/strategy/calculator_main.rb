# frozen_string_literal: true

require './person'
require './plus_calculator'
require './minus_calculator'

puts '계산 시작: +'
person = Person.new(1, 4, PlusCalculator.new)
puts person.calculate

puts '계산 시작: -'
person.change_calculator(MinusCalculator.new)
person.change_number(5, 2)
puts person.calculate
