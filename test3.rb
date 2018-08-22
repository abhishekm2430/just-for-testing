puts "Enter the string"
str = gets.chomp
arr = str.split("")
frequency = Hash.new(0)
arr.map{|key| frequency[key] = frequency[key]+1 }
puts frequency 
#for key in arr
#		frequency[key] = frequency[key] + 1
#end
#arr.each{|key| frequency[key] = arr.count(key)}S
