require 'httparty'

class CurrentConditions
  def initialize(zipcode)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/conditions/q/#{zipcode}.json")
  end

  def location
    @response["current_observation"]["display_location"]["full"]
  end

  def temp_f
    @response["current_observation"]["temp_f"]
  end

  def weather
    @response["current_observation"]["weather"]
  end

end
