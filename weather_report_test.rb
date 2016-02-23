require 'minitest/autorun'
require 'minitest/pride'
require './current_conditions.rb'
require './ten_day_forecast.rb'
require './sunrise_sunset.rb'
require './alerts.rb'
require './active_hurricanes.rb'


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

class SunriseSunset
  def initialize(zipcode)
    @response = JSON.parse(File.read("sunrise_sunset.json"))
  end
end

class Alerts
  def initialize(zipcode)
    @response = JSON.parse(File.read("alerts.json"))
  end
end

class ActiveHurricanes
  def initialize(zipcode)
    @response = JSON.parse(File.read("active_hurricanes.json"))
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

  def test_simple_ten_day_forecast
    t = TenDayForecast.new(27703)
    assert_equal ["Mon", "55", "42", "Rain"], t.simple_forecast.first
    assert_equal ["Wed", "56", "39", "Partly Cloudy"], t.simple_forecast.last
  end

  def test_sunrise_sunset
    s = SunriseSunset.new(27703)
    assert_equal "6:55", s.sunrise
    assert_equal "18:03", s.sunset
  end

  def test_alerts
    a = Alerts.new(27703)
    assert_equal "There are no alerts in this area.", a.alerts?
  end

  def test_active_hurricanes
    h = ActiveHurricanes.new(27703)
    assert_equal ["Invest 90C", "Tropical Cyclone Winston"], h.active_hurricanes
  end
end
