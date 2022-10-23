
# Class: Menu
class Menu
  def initialize
    @menu_components = []
    @name = name
    @description = description

    freeze
  end

  def add(menu_component)
    menu_components.push(menu_component)
  end

  # TODO
  def remove; end

  def get_child(index)
    menu_components[index]
  end

  # TODO
  def print
    p "メニュー: #{name}"
    p "説明: #{description}"
    p '===================================='
  end

  private

  attr_reader :name, :description, :menu_components
end
