require 'httparty'

class TenDayForecast

  def initialize(zipcode)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/forecast10day/q/#{zipcode}.json")
  end

  def text_forecast
    text_forecast_array = []
    @response["forecast"]["txt_forecast"]["forecastday"].each do |n|
      day = n["title"]
      text = n["fcttext"]
      text_forecast_array << [day, text]
    end
    text_forecast_array
  end

  def simple_forecast
    @response["forecast"]["simpleforecast"]["forecastday"].each do |n|
      puts "#{n["date"]["weekday_short"]}, High: #{n["high"]["fahrenheit"]}"
      puts "     Low: #{n["low"]["fahrenheit"]}"
      puts "     Condition: #{n["conditions"]}"
      puts
    end
  end
end
