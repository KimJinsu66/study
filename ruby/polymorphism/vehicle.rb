class Vehicle
  def tyre_type
    puts 'Heavy Car'
  end

  private

  def test
    p 'test'
  end
end

# Using inheritance
class Car < Vehicle
  def tyre_type
    puts 'Small Car'
  end
end

# Using inheritance
class Truck < Vehicle
  def tyre_type
    puts 'Big Car'
  end
end

# Creating object
vehicle = Vehicle.new
vehicle.tyre_type

# Creating different object calling same function
vehicle = Car.new
vehicle.tyre_type

# Creating different object calling same function
vehicle = Truck.new
vehicle.tyre_type

puts "=== polymorphism ==="
# このように書いてコードを書かなくてもよくなる
[Vehicle.new, Car.new, Truck.new].each(&:tyre_type) # ← このような感じがpolymorphism

puts "=== duck typing ==="
vehicles = [Vehicle.new, Car.new, Truck.new]

vehicles.each do |t_vehicle|
  t_vehicle.tyre_type # ← ここが duck typing
end
