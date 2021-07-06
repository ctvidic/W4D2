class Employee
      attr_reader :name, :title, :salary, :boss #:employees

      def initialize(name, title, salary, boss)
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
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        sum = 0
        @employees.each do |employee|
            sum += employee.salary
        end
        sum * multiplier
    end

    def add_employee(employee)
        @employees << employee
    end
end

#ned = Manager.new("Ned", "Founder", 1000000, nil)
#darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
#bob = Employee.new("Bob", "Plumber", 30000, "Jim")
#jim = Manager.new("Jim", "Plumber", 50000, nil)