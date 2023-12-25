# factory patternについて勉強したファイル
class CoffeeFactory
  def create_coffee(coffee_type)
    # 추상 메서드, 하위 클래스에서 구현
  end
end

class AmericanoFactory < CoffeeFactory
  def create_coffee(coffee_type)
    if coffee_type == "Americano"
      Americano.new
    else
      super.create_coffee(coffee_type)
    end
  end
end

class CafeLatteFactory < CoffeeFactory
  def create_coffee(coffee_type)
    if coffee_type == "CafeLatte"
      CafeLatte.new
    else
      super.create_coffee(coffee_type)
    end
  end
end

class CappuccinoFactory < CoffeeFactory
  def create_coffee(coffee_type)
    if coffee_type == "Cappuccino"
      Cappuccino.new
    else
      super.create_coffee(coffee_type)
    end
  end
end

class Americano
  def get_name
    "Americano"
  end
end

class CafeLatte
  def get_name
    "Cafe Latte"
  end
end

class Cappuccino
  def get_name
    "Cappuccino"
  end
end

class CoffeeShop
  def initialize(factory)
    @factory = factory
    @coffees = []
  end
  
  def order_coffee(coffee_type)
    coffee = @factory.create_coffee(coffee_type)
    if coffee
      @coffees << coffee
      puts "Ordered #{coffee.get_name}"
    else
      puts "Sorry, we don't have #{coffee_type} today"
    end
  end
end

# 메인 코드
americano_factory = AmericanoFactory.new
cafe_latte_factory = CafeLatteFactory.new
cappuccino_factory = CappuccinoFactory.new

shop1 = CoffeeShop.new(americano_factory)
shop1.order_coffee("Americano")
shop2 = CoffeeShop.new(cafe_latte_factory)
shop2.order_coffee("CafeLatte")
shop3 = CoffeeShop.new(cappuccino_factory)
shop3.order_coffee("Cappuccino")
