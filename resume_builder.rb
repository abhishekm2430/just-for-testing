class Address
  attr_reader  :house_no, :city, :state, :pin

  def initialize(options)
    @city = options[:city]
    @state = options[:state]
    @house_no = options[:house_no]
    @pin = options[:pin]
  end

  def ==(address)
    self.class == address.class &&
      city == address.city &&
      state == address.state &&
      house_no == address.house_no &&
      pin == address.pin
  end

  def data
    ad = {:house_no=> @house_no, :city=> @city, :state=> @state, :pin=>@pin}
    return ad
  end
end


module Validation
  def is_blank?(value)
    value.to_s.strip == ""
  end

end

class ResumeError < StandardError
  
end

class Resume_builder
  include Validation
  def initialize()
    @resume = []
  end
  def self.run
    loop do
      person1 = Resume_builder.new
      res = person1.build
      puts "\n The details you have entered are :\n"
      puts res
      person1.make_csv
      puts "Do you want to exit y/n"
      option = gets.chomp
      if(option == "y")
        break
      end
    end
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
    full_addr = address.data
    resume1 = [f_name, l_name, age, gender, academic_r, full_addr]
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
    loop do
       fl_name = gets.chomp
      if(fl_name.length < 3)
        puts "Error : It Should be greater than 3 characters"
        puts "Please enter again :"
      else
        return fl_name
      end
    end
  end

  def age_validator
    loop do
      age = gets.chomp.to_i
      if(age < 18 || age > 60)
        puts "Error : Age should be between 18 and 30 years"
        puts "Please enter your age again :"
      else
        return age
      end
    end
  end

  def gender_validator
    loop do
      gender = gets.chomp.upcase
      if(gender != "M" && gender != "F" && gender != "O")
        puts "Error : Gender should be M, F or O"
        puts "Please enter your gender again :"
      else
        return gender
      end
    end
  
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
    loop do
      std = gets.chomp 
      #doing the standard validation
      if(std != "10" && std != "12" && std != "Btech")
        puts "Error : standard should be 10, 12 or Btech"
        puts "Please again enter the #{i}st standard :"
      else
        return std
      end
    end
    
  end

  def year_validator
    loop do
      year = gets.chomp.to_i
      #doing the year validation
      if(year < 2015 || year > 2018)  
        puts "Error : year of passing should be between 2015 to 2018"
        puts "Please again enter the yaer of passing :"
      else
        return year
      end
    end
  end

  def score_validator
    loop do
      score = gets.chomp.to_f
      #doing the score validation
      if(score > 10)
        puts "Error : score should be less than 10"
        puts "Please enter the score again"
      else
        return score
      end
    end
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
    addr = {:house_no => house_no, :city => city, :state => state, :pin => pin}
    address = Address.new(addr)
    return address
  end
end









