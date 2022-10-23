# frozen_string_literal: true

require './menu_component'

# Leaf
class MenuItem < MenuComponent
  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description

    freeze
  end

  def print
    p "메뉴이름: #{name}"
    p "가격: #{price}"
    p "설명: #{description}"

    '-------------------------------'
  end

  private

  attr_reader :name, :description, :price
end
