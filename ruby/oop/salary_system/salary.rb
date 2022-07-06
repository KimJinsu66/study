# frozen_string_literal: true

# Description/Explanation of Salary class
class Salary
  def initialize
    # User or Employee Class에 저장하는게 좋을 것이다
    @employees = {
      employee_a: 400,
      employee_b: 300,
      employee_c: 250
    }
  end

  def main
    name = input_name
    tax_rate = input_tax_rate

    print(name, calculate_salary(name, tax_rate))
  end

  private

  def input_name
    p "이름을 입력해주세요"

    gets.chomp
  end

  def input_tax_rate
    p "소득세율을 입력해주세요"

    gets.chomp.to_f
  end

  def calculate_salary(name, tax_rate)
    p name.to_sym
    base_pay = @employees[name.to_sym]
    p base_pay

    base_pay - (base_pay * tax_rate)
  end

  def print(name, salary)
    p "#{name}직원의 급여는 #{salary}입니다"
  end
end

Salary.new.main
