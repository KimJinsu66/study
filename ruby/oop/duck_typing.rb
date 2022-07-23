class Employee

  def calculate
    'Employee'
  end
end

class SalariedEmployee
  def calculate
    'SalariedEmployee'
  end
end

class HourlyEmployee
  def calculate
    'HourlyEmployee'
  end
end

def calculate(employee)
  employee.calculate
end

# 이처럼 가능
p calculate(Employee.new)
p calculate(SalariedEmployee.new)
p calculate(HourlyEmployee.new)

# 아래와 같이도 가능
[Employee.new, SalariedEmployee.new, HourlyEmployee.new].each do |employee|
  p calculate(employee)
end
