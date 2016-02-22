require 'httparty'

class SunriseSunset

  def initialize(zipcode)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/astronomy/q/#{zipcode}.json")
  end

  def sunrise
    hour = @response["moon_phase"]["sunrise"]["hour"]
    minute = @response["moon_phase"]["sunrise"]["minute"]
    sunrise = "#{hour}:#{minute}"
  end

  def sunset
    hour = @response["moon_phase"]["sunset"]["hour"]
    minute = @response["moon_phase"]["sunset"]["minute"]
    sunrise = "#{hour}:#{minute}"
  end

end
