# frozen_string_literal: true

require './phone'

calls = []
calls.push(Call.new(DateTime.new(2022, 2, 24, 9, 30, 40), DateTime.new(2022, 2, 24, 9, 42, 31)))
calls.push(Call.new(DateTime.new(2022, 3, 24, 10, 32, 40), DateTime.new(2022, 3, 24, 11, 0, 31)))

p AbstractPhone.new(calls).calculate_fee
