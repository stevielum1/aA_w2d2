class Employee
  
  attr_reader :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(multiplier)
    salary * multiplier
  end
  
end

class Manager < Employee
  
  def initialize(name, title, salary, boss = nil, employees = [])
    super(name, title, salary, boss)
    @employees = employees
  end
  
  def bonus(multiplier)
    answer = 0
    @employees.each do |employee|
      answer += employee.salary
    end
    answer * multiplier
  end
end