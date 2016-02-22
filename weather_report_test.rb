require 'minitest/autorun'
require 'minitest/pride'
require './main.rb'


class CurrentConditions
  def initialize(zipcode)
    @response = JSON.parse(File.read("conditions.json"))
  end
end

class TenDayForecast
  def initialize(zipcode)
    @response = JSON.parse(File.read("ten_day_forecast.json"))
  end
end

class WeatherReportTest < Minitest::Test

  def test_current_conditions
    c = CurrentConditions.new(27703)
    assert_equal 49.4, c.temp_f
    assert_equal "Durham, NC", c.location
    assert_equal "Overcast", c.weather
  end

  def test_text_ten_day_forecast
    t = TenDayForecast.new(27703)
    assert_equal ["Monday", "Rain. Lows overnight in the low 40s."], t.text_forecast.first
    assert_equal ["Wednesday Night", "Overcast with rain showers at times. Low 39F. Winds light and variable. Chance of rain 60%."],
      t.text_forecast.last
  end

end
