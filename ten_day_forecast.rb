require 'httparty'

class TenDayForecast

  def initialize(zipcode)
    @zipcode = zipcode
    @conditions = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/forecast10day/q/#{@zipcode}.json")
  end

  def text_forecast
    @conditions["forecast"]["txt_forecast"]["forecastday"].each do |n|
      puts "#{n["title"]}:"
      puts n["fcttext"]
      puts
    end
  end

  def simple_forecast
    @conditions["forecast"]["simpleforecast"]["forecastday"].each do |n|
      puts "#{n["date"]["weekday_short"]}, High: #{n["high"]["fahrenheit"]}"
      puts "     Low: #{n["low"]["fahrenheit"]}"
      puts "     Condition: #{n["conditions"]}"
      puts
    end
  end
end
