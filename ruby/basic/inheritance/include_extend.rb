module IncludeUseable
  def can_include_use?
    true
  end
end

module ExtendUseable
  def can_extend_use?
    true
  end
end

class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args = {})
    @size = args[:size] || 10
    @chain = args[:chain] || 20
    @tire_size = args[:tire_size] || 5

    post_initialize(args)
  end

  def spares
    {
      tire_size: tire_size,
      chain: chain
    }.merge(local_spares)
  end

  private

  def post_initialize(_args)
    nil
  end

  def local_spares
    {}
  end
end


class RoadBike < Bicycle
  include IncludeUseable
  attr_reader :tape_color

 def post_initialize(args)
   # サブクラス側でフックメッセージを受け取りオーバーライドする
   @tape_color = args[:tape_color]
 end

 private

 def local_spares
   { tape_color: tape_color }
 end
end

class MountBike < Bicycle
  extend ExtendUseable

  attr_reader :tape_color

  def post_initialize(args)
    # サブクラス側でフックメッセージを受け取りオーバーライドする
    @tape_color = args[:tape_color]
  end

  private

  def local_spares
    { tape_color: tape_color }
  end
end

puts "include method explain"
road_bike = RoadBike.new({ size: 10, chain: 20, tape_color: 30 })
puts road_bike.can_include_use?

puts "extend method explain"
road_bike = MountBike.new({ size: 10, chain: 20, tape_color: 30 })
puts MountBike.can_extend_use?


road_bike = RoadBike.new({ size: 10, chain: 20, tape_color: 30 })

puts road_bike.inspect
puts "spears: #{road_bike.spares}"

road_bike_2 = RoadBike.new({ size: 10, chain: 20 })

puts road_bike_2.inspect
puts "road_bike_2spears: #{road_bike_2.spares}"

