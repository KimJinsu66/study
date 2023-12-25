class Order
  attr_reader :shop
  def price
    @shop = Show.new
  end

  private

  def validate
    shop.is_open?
    shop.valid_order_amount?
  end

  def ordered
  end
end

class Shop
  def open?
    DateTime.now < "#{DateTime.now.strftime("%F")}: 22:00"
  end

  def valid_order_amount?(price)
    true
  end
end

Order.new.price
