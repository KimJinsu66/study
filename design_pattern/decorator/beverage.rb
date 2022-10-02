
class Beverage
  def description
    '제목없음'
  end

  def cost
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Espresso < Beverage
  def description
    '에스프레스'
  end

  def cost
    300
  end
end

class Decaf < Beverage
  def description
    '디카페'
  end

  def cost
    500
  end
end

# =======================================

class CondimentDecorator < Beverage
  def description

  end
end

class Milk < CondimentDecorator
  attr_reader :beverage

  def initialize(beverage)
    @beverage = beverage

    freeze
  end

  def description
    "#{beverage.description}, 우유"
  end

  def cost
    30 + beverage.cost
  end
end

class Mocha < CondimentDecorator
  attr_reader :beverage

  def initialize(beverage)
    @beverage = beverage

    freeze
  end

  def description
    "#{beverage.description}, 모카"
  end

  def cost
    50 + beverage.cost
  end
end

# main ============================

espresso = Espresso.new

p "메뉴: #{espresso.description}, 가격: #{espresso.cost}"

decaf = Decaf.new
decaf = Milk.new(decaf)
decaf = Mocha.new(decaf)

p decaf.class

p "메뉴: #{decaf.description}, 가격: #{decaf.cost}"

