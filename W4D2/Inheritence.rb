# Learning Goals
# Understand how a subclass inherits from a superclass
# Know how to override a parent class's method
# Know when and how to use super
class Employee
    attr_reader :name, :salary, :title, :boss
    def initialize(name, salary, title, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees, :title
    def initialize(name, salary, title, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        total_salary = 0
        queue = [self]
        until queue.empty?
            unless queue[0].title == "TA"
                queue[0].employees.each do |employee|
                    total_salary += employee.salary
                    queue << employee
                end
            end
            queue.shift
        end
        total_salary * multiplier
    end
end
# Employee and Manager
# Write a class Employee that has attributes that return the employee's name, title, salary, and boss.

# Write another class, Manager, that extends Employee. Manager should have an attribute that holds an array of all employees assigned to the manager. Note that managers might report to higher level managers, of course.

# Add a method, bonus(multiplier) to Employee. Non-manager employees should get a bonus like this

# bonus = (employee salary) * multiplier
# Managers should get a bonus based on the total salary of all of their subordinates, as well as the manager's subordinates' subordinates, and the subordinates' subordinates' subordinates, etc.

# bonus = (total salary of all sub-employees) * multiplier
# Testing
# If we have a company structured like this:

# Name	Salary	Title	Boss
# Ned	\$1,000,000	Founder	nil
ned = Manager.new("Ned", 1000000, "Founder", nil)
# Darren	\$78,000	TA Manager	Ned
darren = Manager.new("Darren", 78000, "TA Manager", ned)
# Shawna	\$12,000	TA	Darren
shawna = Employee.new("Shawna", 12000, "TA", darren)
# David	\$10,000	TA	Darren
david = Employee.new("David", 10000, "TA", darren)

darren.employees << shawna << david

ned.employees << darren
# then we should have bonuses like this:

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000