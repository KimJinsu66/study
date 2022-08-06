class Korea
  attr_reader :population

  @@korea = nil

  private_class_method :new
  def initialize(population)
    @population = population
  end

  def self.instance_korea(population)
    if @@korea.nil?
      @@korea = new(population)
    else
      @@korea
    end
  end
end

korea = Korea.instance_korea(5000)
korea = Korea.instance_korea(7000)
p korea.population
