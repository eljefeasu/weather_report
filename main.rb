require './current_conditions.rb'

puts "Enter a 5-digit zipcode: "
zipcode = gets.chomp

current_conditions = CurrentConditions.new(zipcode)
puts "Location: #{current_conditions.location} "
puts "Temperature (F): #{current_conditions.temp_f} "
puts "Current Conditions: #{current_conditions.weather}"
