
class Beverage
  attr_accessor :size

  def initialize
    @size = 'M' # 지금은 String으로 하지만 enum으로 하는 것이 좋을 듯
  end

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
    case size
    when 'S'
      250
    when 'M'
      300
    when 'L'
      350
    end
  end
end

class Decaf < Beverage
  def description
    '디카페'
  end

  def cost
    case size
    when 'S'
      450
    when 'M'
      500
    when 'L'
      550
    end
  end
end

# =======================================

class CondimentDecorator < Beverage
  attr_reader :beverage

  def initialize(beverage)
    @beverage = beverage

    freeze
  end

  def size
    beverage.size
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
espresso.size = 'L'

p "메뉴: #{espresso.description}, 가격: #{espresso.cost} 사이즈: #{espresso.size}"

espresso.size = 'S'
p "메뉴: #{espresso.description}, 가격: #{espresso.cost} 사이즈: #{espresso.size}"

decaf = Decaf.new
decaf.size = 'L'
decaf = Milk.new(decaf)
decaf = Mocha.new(decaf)

p decaf.class

p "메뉴: #{decaf.description}, 가격: #{decaf.cost} 사이즈: #{decaf.size}"

