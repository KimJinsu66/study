require 'observer'
require './taxman'
require './payroll'

class Employee
  include Observable

  attr_reader :name, :title, :salary

  def initialize(name, title, salary)
    @name = name,
    @title = title,
    @salary = salary

    add_observer(Payroll.new)
    add_observer(TaxMan.new)
  end

  def salary=(new_salary)
    @salary = new_salary

    changed
    notify_observers(self)
  end
end

# main
john = Employee.new('John', 'Senior Vice President', 5000)
john.salary = 5000
john.salary = 5500
