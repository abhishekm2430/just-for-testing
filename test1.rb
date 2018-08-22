class Calculator
	attr_accessor :n1 , :n2
	def initialize(a,b)
	  @n1 = a
		@n2 = b
	end

	def add
		if validiate?
			return (execute {|num1, num2| num1 + num2})
		end
	end

	def subtract
		if validiate?
			return (execute {|num1, num2| num1 - num2})
		end
	end

	def multiply
		if validiate?
			return (execute {|num1, num2| num1 * num2})
		end
	end

	def divide
		if validiate?
			return (execute {|num1, num2| num1 / num2})
		end
	rescue ZeroDivisionError 
		"Division by zero"
	end

	def mod
		if validiate?
			return (execute {|num1, num2| num1 % num2})
		end
	rescue ZeroDivisionError
		"Division by zero"
	end

	private
	def validiate?
		if(@n1.is_a?(Numeric)) && (@n2.is_a?(Numeric))
			return true
		else
			print "The numbers you have entered are not valid "
		end
	end

	def execute
		yield(@n1,@n2)
	end
end

p = Calculator.new(2,3)
#puts "Enter the two numbers"
#a = gets.chomp
#b = gets.chomp
puts p.add
puts p.subtract
puts p.multiply
puts p.divide
puts p.mod

