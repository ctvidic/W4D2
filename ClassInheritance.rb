class Employee
      attr_reader :name, :title, :salary, :boss

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
end