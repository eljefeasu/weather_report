require './current_conditions.rb'
require './ten_day_forecast.rb'
require './sunrise_sunset.rb'
require './alerts.rb'
require './active_hurricanes.rb'

puts "Enter a 5-digit zipcode: "
zipcode = gets.chomp

current_conditions = CurrentConditions.new(zipcode)
puts
puts "Location: #{current_conditions.location} "
puts "Temperature (F): #{current_conditions.temp_f} "
puts "Current Conditions: #{current_conditions.weather}"
puts "Ten Day Forecast: "
puts
ten_day_forecast = TenDayForecast.new(zipcode)
ten_day_forecast.print_text_forecast
# ten_day_forecast.simple_forecast
# ten_day_forecast.print_simple_forecast
sunrise_sunset = SunriseSunset.new(zipcode)
puts
puts "Sunrise: #{sunrise_sunset.sunrise}"
puts "Sunset: #{sunrise_sunset.sunset}"
puts
a = Alerts.new(zipcode)
a.alerts
puts
puts "Active hurricanes (worldwide): "
ah = ActiveHurricanes.new(zipcode)
puts ah.active_hurricanes
