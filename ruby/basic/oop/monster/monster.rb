class Monster
  attr_reader :breed
  def initialize(breed)
    @health = breed.health
    @breed = breed
  end

  def get_attack
    breed.attack
  end
end

class Breed
  attr_reader :attack, :health

  def initialize(name, health, attack)
    @name = name
    @health = health
    @attack = attack
  end
end

dragon = Monster.new(Breed.new('dragon', 230, 'fire'))
troll = Monster.new(Breed.new('troll', 48, 'gonbon'))

p dragon.get_attack
p troll.get_attack
