require 'httparty'

class SunriseSunset

  def initialize(zipcode)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/conditions/q/#{zipcode}.json")
  end



end
