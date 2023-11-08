require_relative "employee.rb"

class Manager < Employee

    attr_accessor :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    # def add_employees(employee)
    #     @employees << employee
    # end


    # darren > 22000

    def bonus(multiplier)
        total_sub_salary * multiplier
    end

    def total_sub_salary
        total_salary = 0    
    
        @employees.each do |emp|    # ned has a child, darren   | darren.each do |darren|     # shawna, david
            if emp.is_a?(Manager)
                total_salary += emp.salary + emp.total_sub_salary
            else
                total_salary += emp.salary 
            end
        end

        total_salary
    end

end

ned = Manager.new("ned", "founder", 1000000, nil)
darren = Manager.new("darren", "Ta manager", 78000, ned)
shawna = Employee.new("shawna", "TA", 12000, darren)
david = Employee.new("david", "TA", 10000, darren)
ned.employees = [darren]
darren.employees = [shawna, david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000


# (78000 + 12000 + 10000) * multiplier
# 100000 * 5
# 500000

# 12000
# 10000

# 22000