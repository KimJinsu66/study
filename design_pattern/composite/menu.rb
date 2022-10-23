# frozen_string_literal: true

class Menu
  def initialize(name, description)
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

  def print
    p '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
    p "メニュー: #{name}"
    p "説明: #{description}"

    unless menu_components.empty?
      menu_components.each do |menu|
        p menu.print
      end
      '메뉴 끝, 메뉴 선택 후 벨을 눌러주세요'
    else
      'Menu가 없습니다'
    end
  end

  private

  attr_reader :name, :description, :menu_components
end
