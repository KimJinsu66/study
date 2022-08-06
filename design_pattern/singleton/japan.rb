class Japan
  attr_reader :population

  private_class_method :new

  def self.instance
    UNIQUE_INSTANCE
  end

  def change_population(params_population)
    @population = params_population
  end

  private

  UNIQUE_INSTANCE = new
end

japan = Japan.instance
japan2 = Japan.instance

japan.change_population(12_000)
p japan.population

japan2.change_population(14_000)
p japan.population
