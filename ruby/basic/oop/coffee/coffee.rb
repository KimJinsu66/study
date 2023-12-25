class Customer
  def order(menu)
    menu_item = MenuBoard.new.menu(menu)
    coffee = Baristar.new.make_coffee(menu_item)

    coffee
  end
end

class MenuBoard
  def initialize
    @menu_list = [Americano, Cappuccino, CaffeLatte]
  end

  def menu(name)
    @menu_list.find { |menu| menu.name == name } || 'menuがありません'
  end
end

class Baristar
  def make_coffee(menu_item)
    menu_item.new.notify
  end
end

class Coffee
  def notify
    p "メニューがありません!"
  end
end

class Americano < Coffee
  def notify
    p "Americanoです"
  end
end

class Cappuccino < Coffee
  def notify
    p "Cappuccinoです"
  end
end

class CaffeLatte < Coffee
  def notify
    p "CaffeLatteです"
  end
end

# ======================
# main
# ======================

customer = Customer.new

customer.order('Americano')
customer.order('Cappuccino')
customer.order('CaffeLatte')
customer.order('Coffee')
