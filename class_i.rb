require 'byebug'

class Employee
  attr_reader :boss, :name, :title, :salary

  def initialize(name, title, salary, boss)
    @name, @title, @salary = name, title, salary
    @boss = set_boss(boss)
  end

  def set_boss(boss)
    if boss
      boss.employees << self
      boss
    else
      nil
    end
  end

  def bonus(multiplyer)
    @salary * multiplyer
  end

end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super(name, title, salary, boss)
  end



  def bonus(multiplyer)
    sum = 0
    @employees.each do |employee|

      if employee.title.include?('Manager')
        sum += employee.salary
        employee.employees.each { |empl| sum += empl.salary }
      else
        sum += employee.salary
      end
    end

    sum * multiplyer
  end
end
