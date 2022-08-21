class JinsuCafe
  attr_accessor :kind

  def initialize
    @kind = nil
  end

  def order(beverage_kind)
    @kind = beverage_kind
    make_beverage

    p "作られた#{kind}が完了しました"
  end

  private

  def make_beverage
    case kind
    when 'coffee'
      Coffee.new.prepare_recipe
    when 'tea'
      Tea.new.prepare_recipe
    end
  end
end

class Beverage
  def prepare_recipe
    boil_water
    brew
    pour_in_cup
    add_condiments
  end

  private

  def boil_water
    p '水をわかす'
  end

  def brew
    raise '実装してください'
  end

  def pour_in_cup
    p 'カップに入れる'
  end

  def add_condiments
    raise '実装してください'
  end
end

class Coffee < Beverage
  def prepare_recipe
    boil_water
    brew
    pour_in_cup
    add_condiments
  end

  private

  def brew
    p 'コーヒーをつくる'
  end

  def add_condiments
    p '砂糖を入れる'
  end
end

class Tea < Beverage
  def prepare_recipe
    boil_water
    brew
    pour_in_cup
    add_condiments
  end

  private

  def brew
    p 'お茶をつくる'
  end

  def add_condiments
    p 'レモンを追加する'
  end
end

class Client
  def main
    jinsu_cafe = JinsuCafe.new

    jinsu_cafe.order('coffee')
    jinsu_cafe.order('tea')
  end
end

Client.new.main
