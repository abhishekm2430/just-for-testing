class Resume_builder
	def initialize()
		@resume = []
	end
	def build	
		puts "Enter the First name :"
		f_name = name_validator
		@resume.push(f_name)

		puts "Enter your last name :"
		l_name = name_validator
		@resume.push(l_name)

		puts "Enter your Age :"
		age = age_validator
		@resume.push(age)

		puts "Enter your Gender :"
		gender = gender_validator
		@resume.push(gender)

		puts "Enter your Academic details :"
		academic_r = academic_report 

		puts "Enter Your Address"
		address = address_validator
		resume1 = [f_name, l_name, age, gender, academic_r, address]
		return resume1
	end

	def make_csv
		require "csv"
		CSV.open("file.csv", "a+") do |csv|
		  csv << @resume
		end
	end

	private 
	def name_validator
		fl_name = gets.chomp
		while(fl_name.length < 3)
			puts "Error : It Should be greater than 3 characters"
			puts "Please enter again :"
			fl_name = gets.chomp
		end
		return fl_name
	end

	def age_validator
		age = gets.chomp.to_i
		while(age < 18 || age > 60)
			puts "Error : Age should be between 18 and 30 years"
			puts "Please enter your age again :"
			age = gets.chomp.to_i
		end
		return age
	end

	def gender_validator
		gender = gets.chomp.upcase
		while(gender != "M" && gender != "F" && gender != "O")
			puts "Error : Gender should be M, F or O"
			puts "Please enter your gender again :"
			gender = gets.chomp.upcase
		end
		return gender
	end

	def academic_report
		academic = Array.new
		i = 1
		while(academic.length < 3)
			puts "Enter the #{i}st standard"
			std = standard_validator
			@resume.push(std)
			puts "Enter the year of passing"
			year = year_validator
			@resume.push(year)
			puts "Enter: your score out of 10"
			score = score_validator
			@resume.push(score)
			temp = {:std => std, :year => year, :score => score}
			academic.push(temp)
			i = i + 1
		end
		return academic
	end

	def standard_validator
		std = gets.chomp 
		#doing the standard validation
		while(std != "10" && std != "12" && std != "Btech")
			puts "Error : standard should be 10, 12 or Btech"
			puts "Please again enter the #{i}st standard :"
			std = gets.chomp
		end
		return std
	end

	def year_validator
		year = gets.chomp.to_i
		#doing the year validation
		while(year < 2015 || year > 2018)  
			puts "Error : year of passing should be between 2015 to 2018"
			puts "Please again enter the yaer of passing :"
			year = gets.chomp.to_i
		end
		return year
	end

	def score_validator
		score = gets.chomp.to_f
		#doing the score validation
		while(score > 10)
			puts "Error : score should be less than 10"
			puts "Please enter the score again"
			score = gets.chomp.to_f
		end
		return score
	end

	def address_validator
		puts "Enter the house no :"
		house_no = gets.chomp
		@resume.push(house_no)
		puts "Enter the city :"
		city = gets.chomp
		@resume.push(city)
		puts "Enter the state :"
		state = gets.chomp
		@resume.push(state)
		puts "Enter the Pin Code :"
		pin = gets.chomp
		while(pin.length != 6)
			puts "Error : Pin code should be of 6 digits"
			puts "Please again enter the Pincode"
			pin = gets.chomp
		end
		@resume.push(pin)
		address = {:house_no => house_no, :city => city, :state => state, :pin => pin}
		return address
	end
end

person1 = Resume_builder.new
res = person1.build
puts "\n The details you have entered are :\n"
puts res
person1.make_csv









