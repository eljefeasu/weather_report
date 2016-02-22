require 'httparty'

class CurrentConditions
  def initialize(zipcode)
    @zipcode = zipcode
    @conditions = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/conditions/q/#{@zipcode}.json")
  end

  def location
    @conditions["current_observation"]["display_location"]["full"]
  end

  def temp_f
    @conditions["current_observation"]["temp_f"]
  end

  def weather
    @conditions["current_observation"]["weather"]
  end

end
