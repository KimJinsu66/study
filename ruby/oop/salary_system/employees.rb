class Employees
  attr_reader :name, :base_pay

  def initialize(name, base_pay)
    @name = name,
    @base_pay = base_pay
  end

  def calculate_pay(tax_rate)
    raise NotImplementedError
  end

  def monthly_base_pay
    raise NotImplementedError
  end
end

class SalariedEmployee < Employee
  def initialize(name, base_pay)
    super(name, base_pay)
  end

  def calculate_pay(tax_rate)
    base_pay - (base_pay * tax_rate)
  end

  def monthly_base_pay
    base_pay
  end
end

class HourlyEmployee < Employees
  attr_reader :time_card

  def initialize(name, base_pay, time_card)
    super(name, base_pay)
    @time_card = time_card
  end

  def calculate_pay(tax_rate)
    (base_pay * time_card) - (base_pay * time_card) * tax_rate
  end

  def monthly_base_pay
    0
  end
end
